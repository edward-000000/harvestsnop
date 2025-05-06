<?php
// Incluye el archivo de inicialización del framework o aplicación
include ("_init.php");

// Verifica si el modo DEMO está activado
if (DEMO) {
    // Si es DEMO, muestra un mensaje indicando que la función está deshabilitada y sale
    die(trans('text_disabled_in_demo'));
}

// Carga el modelo 'cron' a través del registro y el cargador
$cronModel = registry()->get('loader')->model('cron');

// Verifica si no se ha especificado una acción en la URL (GET/POST)
// Y si no se está ejecutando desde la línea de comandos (CLI) con un argumento
if (!isset($request->get['action'])
    && !isset($request->post['action'])
    && (!isset($argc) || !isset($argv[1]))) {

    // Si no se especifica ninguna acción de ninguna manera, simplemente sale
    exit();
}

// Determina el valor de la acción a realizar
$action = '';
// Prioridad: 1. Parámetro 'action' en GET
if (isset($request->get['action'])) {
    $action = $request->get['action'];
// Prioridad: 2. Parámetro 'action' en POST
} elseif (isset($request->post['action'])) {
    $action = $request->post['action'];
// Prioridad: 3. Primer argumento si se ejecuta desde la línea de comandos (CLI)
} elseif (isset($argv[1])) {
    $action = $argv[1];
}
// Registra en el log que se está iniciando una acción de Cron
$log->write('Cron: '.$action.' Iniciando...');


// Si la acción es 'CHECKFORUPDATE'
if ($action == 'CHECKFORUPDATE') {
    // Llama al método CheckForUpdate del modelo cron
    $cronModel->CheckForUpdate($action);
}


// Si la acción es 'DBBACKUP' (Copia de seguridad de la base de datos)
if ($action == 'DBBACKUP') {
    // Llama al método DBBackup del modelo cron
    $cronModel->DBBackup($action);
}


// Si la acción es 'SENDCUSTOMERBIRTHDAYSMS' (Enviar SMS de Cumpleaños a Clientes)
if ($action == 'SENDCUSTOMERBIRTHDAYSMS') {
    // Llama al método SendCustomerBirthDaySMS del modelo cron
    $cronModel->SendCustomerBirthDaySMS($action);
}


// Si la acción es 'PUSHSQLTOREMOTESERVER' (Enviar SQL a Servidor Remoto)
if ($action == 'PUSHSQLTOREMOTESERVER') {
    // Llama al método PushSqlToRemoteServer del modelo cron
}


// Si la acción es 'RUNALLJOBS' (Ejecutar Todos los Trabajos)
if ($action == 'RUNALLJOBS') {
    // Llama al método Run del modelo cron (probablemente ejecuta múltiples tareas)
    $cronModel->Run($action);
}

// Imprime los mensajes de error o éxito
// Verifica si se está ejecutando desde la línea de comandos
if (is_cli()) {
    // Si es CLI, imprime errores y mensajes con saltos de línea para la consola
    foreach ($cronModel->err as $err) {
        echo '---'.$err . PHP_EOL;
    }
    foreach ($cronModel->msg as $msg) {
        echo '---'.$msg . PHP_EOL;
    }

} else {
    // Si no es CLI (ejecución web), imprime errores y mensajes con etiquetas <br>
    foreach ($cronModel->err as $err) {
        echo '---'.$err .'</br>';
    }
    foreach ($cronModel->msg as $msg) {
        echo '---'.$msg .'</br>';
    }
}


/*
----------------------------------------
| Usos
----------------------------------------
|   Trabajo de Cron (ejecutar diariamente a la 1:00 AM):
|   0 1 * * * wget -qO- http://pos/admin/cron.php >/dev/null 2>&1
*/