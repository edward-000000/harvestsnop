<?php
// Define el nombre de la aplicación
$timezone = 'America/Lima';
// Define el ID de la aplicación
define('APPID', '61e0732afd118dbe7f86af6d346770e2');

// Establece la zona horaria. Lima, Perú.
$timezone = 'America/Lima';
if(function_exists('date_default_timezone_set')) {
    date_default_timezone_set($timezone);
}

/*
 *---------------------------------------------------------------
 * ENTORNO DEL SISTEMA
 *---------------------------------------------------------------
 *
 * Puedes cargar diferentes configuraciones dependiendo de tu
 * entorno actual. Configurar el entorno también influye en
 * aspectos como el registro de errores y la presentación de errores.
 *
 * Puede establecerse a cualquier valor, pero el uso por defecto es:
 *
 * development (desarrollo)
 * production (producción)
 */

define('ENVIRONMENT', 'production'); // Establece el entorno a producción

switch (ENVIRONMENT)
{
    case 'development': // Si el entorno es desarrollo
        error_reporting(-1); // Reportar todos los errores
        ini_set('display_errors', 1); // Mostrar errores en la salida
        break;

    case 'production': // Si el entorno es producción
        ini_set('display_errors', 0); // No mostrar errores en la salida
        // Configuración de reporte de errores más restrictiva para producción
        if (version_compare(PHP_VERSION, '5.3', '>='))
        {
            error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT & ~E_USER_NOTICE & ~E_USER_DEPRECATED);
        }
        else
        {
            error_reporting(E_ALL & ~E_NOTICE & ~E_STRICT & ~E_USER_NOTICE);
        }
        break;
}

// Verificar el número de versión de PHP
if (version_compare(phpversion(), '5.6.0', '<') == true) {
    // Si la versión de PHP es menor a 5.6.0, mostrar un mensaje y salir
    exit('Se requiere PHP 5.6+');
}

// Compatibilidad con Windows IIS
// Intenta determinar DOCUMENT_ROOT si no está configurado (común en IIS)
if (!isset($_SERVER['DOCUMENT_ROOT'])) {
    if (isset($_SERVER['SCRIPT_FILENAME'])) {
        $_SERVER['DOCUMENT_ROOT'] = str_replace('\\', '/', substr($_SERVER['SCRIPT_FILENAME'], 0, 0 - strlen($_SERVER['PHP_SELF'])));
    }
}

if (!isset($_SERVER['DOCUMENT_ROOT'])) {
    if (isset($_SERVER['PATH_TRANSLATED'])) {
        $_SERVER['DOCUMENT_ROOT'] = str_replace('\\', '/', substr(str_replace('\\\\', '\\', $_SERVER['PATH_TRANSLATED']), 0, 0 - strlen($_SERVER['PHP_SELF'])));
    }
}

// Intenta determinar REQUEST_URI si no está configurado
if (!isset($_SERVER['REQUEST_URI'])) {
    $_SERVER['REQUEST_URI'] = substr($_SERVER['PHP_SELF'], 1);

    if (isset($_SERVER['QUERY_STRING'])) {
        $_SERVER['REQUEST_URI'] .= '?' . $_SERVER['QUERY_STRING'];
    }
}

// Intenta determinar HTTP_HOST si no está configurado
if (!isset($_SERVER['HTTP_HOST'])) {
    $_SERVER['HTTP_HOST'] = getenv('HTTP_HOST');
}

// Verificar si es SSL o no
if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
    $_SERVER['HTTPS'] = true; // Es SSL
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' || !empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on') {
    $_SERVER['HTTPS'] = true; // Es SSL (a través de proxy/balanceador)
} else {
    $_SERVER['HTTPS'] = false; // No es SSL
}

// Cargar archivo de configuración
require_once __DIR__.DIRECTORY_SEPARATOR.'config.php';


// Definir el protocolo (http o https)
define('PROTOCOL', isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == "on" ? 'https' : 'http');
// Determinar el subdirectorio si existe
$subdir = SUBDIRECTORY ? '/' . rtrim(SUBDIRECTORY, '/\\') : '';
// Definir la URL raíz de la aplicación
define('ROOT_URL', PROTOCOL . '://' . rtrim($_SERVER['HTTP_HOST'], '/\\') . $subdir);

// Carga Automática de Librerías
function autoload($class)
{
    // Construir la ruta del archivo de la clase
    $file = DIR_INCLUDE . 'lib/' . str_replace('\\', '/', strtolower($class)) . '.php';
    // Si el archivo existe, incluirlo y retornar true
    if (file_exists($file)) {
        include($file);
        return true;
    } else {
        return false; // El archivo no existe
    }
}
// Registrar la función autoload
spl_autoload_register('autoload');
// Establecer extensiones para spl_autoload
spl_autoload_extensions('.php');

// Incluir la librería php-hooks
require_once DIR_VENDOR . 'php-hooks/src/voku/helper/Hooks.php';

// Cargar Registry (Registro)
$registry = new Registry();

// Sesión
// Si no es un script de línea de comandos (CLI)
if (!(PHP_SAPI === 'cli' OR defined('STDIN'))) {
    $session = new Session($registry); // Crear una nueva sesión
    $registry->set('session', $session); // Registrar la sesión
}

// log (Registro de eventos/errores)
$log = new Log('log.txt'); // Crear un nuevo objeto de Log
$registry->set('log', $log); // Registrar el log

// Loader (Cargador)
$loader = new Loader($registry); // Crear un nuevo objeto Loader
$registry->set('loader', $loader); // Registrar el loader

// Hook (Ganchos/Eventos)
// Se asume que $Hooks viene de la inclusión previa de php-hooks
$registry->set('hooks', $Hooks); // Registrar los hooks

// CONFIGURACIÓN DE LA BASE DE DATOS.
// Obtener detalles de la base de datos desde $sql_details (asumimos que viene de config.php)
$dbhost = $sql_details['host'];
$dbname = $sql_details['db'];
$dbuser = $sql_details['user'];
$dbpass = $sql_details['pass'];
$dbport = $sql_details['port'];

// Funciones de Ayuda (Helpers)
// Incluir varios archivos de funciones de ayuda
require_once DIR_HELPER . 'utf8.php';
require_once DIR_HELPER . 'language.php';
require_once DIR_HELPER . 'network.php';
require_once DIR_HELPER . 'setting.php';
require_once DIR_HELPER . 'common.php';
require_once DIR_HELPER . 'countries.php';
require_once DIR_HELPER . 'file.php';
require_once DIR_HELPER . 'image.php';
require_once DIR_HELPER . 'pos.php';
require_once DIR_HELPER . 'pos_register.php';
require_once DIR_HELPER . 'box.php';
require_once DIR_HELPER . 'currency.php';
require_once DIR_HELPER . 'expense.php';
require_once DIR_HELPER . 'income.php';
require_once DIR_HELPER . 'customer.php';
require_once DIR_HELPER . 'invoice.php';
require_once DIR_HELPER . 'quotation.php';
require_once DIR_HELPER . 'purchase.php';
require_once DIR_HELPER . 'pmethod.php';
require_once DIR_HELPER . 'product.php';
require_once DIR_HELPER . 'report.php';
require_once DIR_HELPER . 'store.php';
require_once DIR_HELPER . 'supplier.php';
require_once DIR_HELPER . 'brand.php';
require_once DIR_HELPER . 'user.php';
require_once DIR_HELPER . 'usergroup.php';
require_once DIR_HELPER . 'validator.php';
require_once DIR_HELPER . 'category.php';
require_once DIR_HELPER . 'expense_category.php';
require_once DIR_HELPER . 'income_source.php';
require_once DIR_HELPER . 'unit.php';
require_once DIR_HELPER . 'taxrate.php';
require_once DIR_HELPER . 'giftcard.php';
require_once DIR_HELPER . 'banking.php';
require_once DIR_HELPER . 'bankaccount.php';
require_once DIR_HELPER . 'loan.php';
require_once DIR_HELPER . 'installment.php';
require_once DIR_HELPER . 'transfer.php';
require_once DIR_HELPER . 'postemplate.php';
require_once DIR_HELPER . 'sell_return.php';
require_once DIR_HELPER . 'purchase_return.php';

// Verificar restricciones de IP si no es CLI
if (!is_cli()) {
    // Denegar acceso si la IP está en la lista de IPs denegadas
    if (in_array(get_real_ip(), denied_ips())) {
        exit('No tienes permiso para acceder!!!');
    }

    // Permitir acceso solo a IPs específicas si la lista no está vacía
    if (!empty(allowed_only_ips()) && !in_array(get_real_ip(), allowed_only_ips())) {
        exit('No tienes permiso para acceder!!!');
    }
}

// Redireccionar al modo de mantenimiento si el archivo .maintenance existe
if (file_exists(ROOT.DIRECTORY_SEPARATOR.'.maintenance') && current_nav() != 'maintenance') {
    header('Location: '.root_url().'/maintenance.php', true, 302);
}

// Conexión a la Base de Datos
try {
    // Crear una nueva instancia de la base de datos (se asume que Database es una clase)
    $db = new Database("mysql:host={$dbhost};port={$dbport};dbname={$dbname};charset=utf8",$dbuser,$dbpass);
    // Establecer el modo de error para lanzar excepciones en caso de fallos
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // Definir una función global para acceder a la conexión de la base de datos
    function db()
    {
        global $db;
        return $db;
    }
}
catch(PDOException $e) {
    // Si hay un error de conexión, mostrar un mensaje y salir
    die('Error de conexión: '.$e->getMessage());
}
// Registrar la conexión a la base de datos
$registry->set('db', $db);

// Verificar si la base de datos seleccionada no está vacía si no está instalado
if ($dbname) {
    $statement = $db->prepare("SHOW TABLES");
    $statement->execute();
    // Si no está definido INSTALLED y hay tablas, mostrar un error
    if (!defined('INSTALLED') && $statement->rowCount() > 0) {
        die("Has activado el modo de instalación, pero la base de datos seleccionada <strong>({$dbname})</strong> no está vacía!");
    }
}

// Redireccionar al instalador si no está definido INSTALLED
if (!defined('INSTALLED')) {
    header('Location: '.root_url().'/install/index.php', true, 302);
}

// Request (Solicitud HTTP)
$request = new Request(); // Crear un nuevo objeto Request
$registry->set('request', $request); // Registrar la solicitud

// Store (Tienda/Sucursal)
$store = new Store($registry); // Crear un nuevo objeto Store
$registry->set('store', $store); // Registrar la tienda

// ESNECIL Start (Bloque relacionado con la licencia/verificación - "LICENSE" escrito al revés?)
// Si está instalado y el archivo ecnesil.php no existe
if (defined('INSTALLED') && !is_file(DIR_INCLUDE.'ecnesil.php') || !file_exists(DIR_INCLUDE.'ecnesil.php')) {
    $file = DIR_INCLUDE.'config/purchase.php';
    @chmod($file, FILE_WRITE_MODE); // Intentar cambiar permisos
    $line2 = "return array('username'=>'','purchase_code'=>'');"; // Línea a escribir
    $data = array(2 => $line2); // Datos para reemplazar
    replace_lines($file, $data); // Reemplazar líneas en el archivo

    repalce_stock_status('false'); // Llamar a una función para reemplazar estado de stock

    @chmod($config_path, FILE_READ_MODE); // Intentar cambiar permisos de nuevo
}

// Definir ESNECIL basado en el contenido de config/purchase.php si existe
if (defined('INSTALLED') && is_file(DIR_INCLUDE.'config/purchase.php') && file_exists(DIR_INCLUDE.'config/purchase.php')) {
    define('ESNECIL', json_encode(require_once DIR_INCLUDE.'config/purchase.php'));
} else {
    define('ESNECIL', 'error'); // Si no existe el archivo, definir como error
    repalce_stock_status('false'); // Reemplazar estado de stock a false
}

// LISENCE DISABLED (Licencia Desactivada) - Comentarios originales
// if (!STOCK_CHECK)
// {
//  check_runtime();
// }

// if (!current_nav() || current_nav() == 'index' || current_nav() == 'logout')
// {
//  repalce_stock_status('false');
// }
// ESNECIL End

// Timezone (Zona Horaria)
// Obtener la zona horaria de las preferencias del usuario si está configurada, de lo contrario usar la zona horaria predeterminada
$timezone = get_preference('timezone') ? get_preference('timezone') : $timezone;
// if (!ini_get('date.timezone')) { // Línea comentada originalmente
// Establecer la zona horaria por defecto
if(function_exists('date_default_timezone_set')) {
    date_default_timezone_set($timezone);
}
// }

// User (Usuario)
$user = new User($registry); // Crear un nuevo objeto User
$registry->set('user', $user); // Registrar el usuario

// Set Language (Establecer Idioma)
$user_preference = $user->getAllPreference(); // Obtener todas las preferencias del usuario
// Si se especifica 'lang' en la URL y no es nulo/indefinido
if (isset($request->get['lang']) && $request->get['lang'] && $request->get['lang'] != 'null' && $request->get['lang'] != 'undefined') {
    // Si no se pide ignorar el cambio de idioma
    if (!isset($request->get['ignore_lang_change'])) {
        unset($user_preference['language']); // Eliminar idioma anterior de preferencias
        $user_preference['language'] = $request->get['lang']; // Establecer el nuevo idioma
        $user->updatePreference($user_preference, user_id()); // Actualizar preferencias en la base de datos
    }
}
// Si no hay idioma en las preferencias, establecer 'en' (inglés) como predeterminado
if (!isset($user_preference['language']) || !$user_preference['language']) {
    $user_preference['language'] = 'en';
    $user->updatePreference($user_preference, user_id());
}
// Bloque de código comentado que forzaría el idioma a inglés
// if (isset($user_preference['language']) && $user_preference['language'] != 'en') {
//  $user_preference['language'] = 'en';
//  $user->updatePreference($user_preference, user_id());
// }

// Language (Idioma)
$active_lang = $user->getPreference('language', 'es'); // Obtener el idioma activo (predeterminado 'en')
$language = new Language($active_lang); // Crear un nuevo objeto Language
$registry->set('language', $language); // Registrar el idioma
$language->load(); // Cargar los archivos de idioma

// Set Current Store By Query String (Establecer Tienda Actual por Parámetro en la URL)
// Si se especifica 'active_store_id' en la URL
if (isset($request->get['active_store_id']))
{
    try {
        $store_id = $request->get['active_store_id']; // Obtener el ID de la tienda de la URL
        $belongsStores = $user->getBelongsStore(); // Obtener las tiendas a las que pertenece el usuario
        $store_ids = array(); // Inicializar array de IDs de tiendas
        foreach ($belongsStores as $the_store) {
            $store_ids[] = $the_store['store_id']; // Llenar array con IDs
        }
        // Si el usuario no es admin (grupo 1) y no pertenece a la tienda solicitada, lanzar error
        if ($user->getGroupId() != 1 && !in_array($store_id, $store_ids)) {
            throw new Exception(trans('error_access_permission')); // Lanzar excepción con mensaje traducido
            exit(); // Salir
        }
        $store->openTheStore($store_id); // Abrir/establecer la tienda actual

        // Responder con JSON indicando redirección
        header('Content-Type: application/json');
        echo json_encode(array('msg' => trans('text_redirecting_to_dashbaord')));
        exit(); // Salir

    } catch (Exception $e) {
        // Si ocurre una excepción (error), responder con un estado de error HTTP y mensaje JSON
        header('HTTP/1.1 422 Unprocessable Entity');
        header('Content-Type: application/json; charset=UTF-8');
        echo json_encode(array('errorMsg' => $e->getMessage()));
        exit(); // Salir
    }
}

// Functions (Funciones)
// Incluir el archivo de funciones generales
include ('functions.php');

// Device Detection (Detección de Dispositivo)
$detect = new mobiledetect; // Crear un nuevo objeto Mobile_Detect
// Determinar el tipo de dispositivo
$deviceType = ($detect->isMobile() ? ($detect->isTablet() ? 'tablet' : 'phone') : 'computer');

// Document (Documento HTML)
$document = new Document($registry); // Crear un nuevo objeto Document
$document->setBodyClass(); // Establecer clases CSS para el body
$registry->set('document', $document); // Registrar el documento

// Currency (Moneda)
$currency = new Currency($registry); // Crear un nuevo objeto Currency
$registry->set('currency', $currency); // Registrar la moneda

// Función global para acceder al Registry
function registry()
{
    global $registry;
    return $registry;
}

// Datatable (Librería para tablas de datos)
// Incluir la clase SSP (Server-Side Processing) para DataTables
require_once DIR_LIBRARY . 'ssp.class.php';

// Revalidation Start (Inicio de Revalidación - Bloque relacionado con la licencia)
// Si está instalado, se solicita 'esnecilchk' y coincide con el hash generado, y la acción es 'unblock'
if (defined('INSTALLED') && isset($request->get['esnecilchk'])
    && rawurlencode($request->get['esnecilchk']) == rawurlencode(urldecode(hash_generate()))
    && isset($request->get['action'])
    && $request->get['action'] == 'unblock') {
    // Reemplazar estado de stock a false y marcar como 'unblock'
    repalce_stock_status('false','unblock');
    // Responder con JSON indicando que se desbloqueó
    echo json_encode(array(
        'status' => 'Unblocked!', // Estado: Desbloqueado!
        'message' => 'App is Unblocked.', // Mensaje: La App está Desbloqueada.
        'info' => array( // Información adicional
            'ip' => get_real_ip(),
            'mac' => getMAC(),
            'email' =>  store('email'),
            'phone' => store('mobile'),
            'country' => store('country'),
            'zip_code' => store('zip_code'),
            'address' => store('address'),
            'user1' => get_the_user(1),
            'user2' => get_the_user(2),
            'user3' => get_the_user(3),
        ),
        'for' => 'validation', // Propósito: validación
    ));
    exit(); // Salir
}

// Si está instalado y se solicita 'esnecilchk' y coincide con el hash generado
if (defined('INSTALLED') && isset($request->get['esnecilchk']) && rawurlencode($request->get['esnecilchk']) == rawurlencode(urldecode(hash_generate())))
{
    // Intentar abrir una conexión de socket a google.com para verificar conectividad
    if($socket =@ fsockopen('www.google.com', 80, $errno, $errstr, 30))
    {
        fclose($socket); // Cerrar el socket
        $status = 'ok'; // Estado inicial: ok
        // Verificar si el código de compra o nombre de usuario son válidos
        if (!get_pcode() || !get_pusername() || get_pcode() == 'error' || get_pusername() == 'error') {
            $status = 'error'; // Si no son válidos, estado: error
        }
        // Preparar información para la llamada a la API de revalidación
        $info = array(
            'username' => get_pusername(),
            'purchase_code' => get_pcode(),
            'domain' => ROOT_URL,
            'action' => 'revalidate',
        );
        $apiCall = apiCall($info); // Realizar llamada a la API
        // Verificar la respuesta de la API
        if (!is_object($apiCall) || !property_exists($apiCall, 'status')) {
            $status = 'error'; // Si la respuesta no es válida, estado: error
        }
        $status = $apiCall->status; // Obtener el estado de la respuesta de la API
        // Si el estado de la API es error
        if($status == 'error') {
            // Responder con JSON indicando que está bloqueado
            echo json_encode(array(
                'status' => 'Blocked!', // Estado: Bloqueado!
                'message' => 'Invalid Purchase Code', // Mensaje: Código de Compra Inválido
                'info' => array( // Información adicional
                    'ip' => get_real_ip(),
                    'mac' => getMAC(),
                    'email' =>  store('email'),
                    'phone' => store('mobile'),
                    'country' => store('country'),
                    'zip_code' => store('zip_code'),
                    'address' => store('address'),
                    'user1' => get_the_user(1),
                    'user2' => get_the_user(2),
                    'user3' => get_the_user(3),
                ),
                'for' => 'validation', // Propósito: validación
            ));
            // Intentar modificar el archivo de compra para invalidar el código
            $file = DIR_INCLUDE.'config/purchase.php';
            @chmod($file, FILE_WRITE_MODE);
            $line2 = "return array('username'=>'','purchase_code'=>'');";
            $data = array(2 => $line2);
            replace_lines($file, $data);
            @chmod($config_path, FILE_READ_MODE);

            // Reemplazar estado de stock a false y marcar como 'blocked'
            repalce_stock_status('false','blocked');
            repalce_stock_status('false'); // Parece redundante, podría ser un error original

            @chmod($config_path, FILE_READ_MODE); // Intentar cambiar permisos de nuevo
            exit(); // Salir
        }
        // Si el estado de la API es ok
        echo json_encode(array(
            'status' => 'ok', // Estado: ok
            'message' => 'Valid Purchase Code', // Mensaje: Código de Compra Válido
            'info' => array( // Información adicional
                'ip' => get_real_ip(),
                'mac' => getMAC(),
                'email' =>  store('email'),
                'phone' => store('mobile'),
                'country' => store('country'),
                'zip_code' => store('zip_code'),
                'address' => store('address'),
                'user1' => get_the_user(1),
                'user2' => get_the_user(2),
                'user3' => get_the_user(3),
            ),
            'for' => 'validation', // Propósito: validación
        ));
        exit(); // Salir
    }
}

// Si está instalado y definido BLOCKED (bloqueado)
if (defined('INSTALLED') && defined('BLOCKED')) {
    // Mostrar una página HTML indicando que la aplicación está bloqueada debido a un código de compra inválido
    die("<!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv=\"Content-type\" content=\"text/html;charset=UTF-8\">
        <title>Inválido</title> <meta content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\" name=\"viewport\">
        <style type=\"text/css\">
          body { text-align: center; padding: 100px; }
          h1 { font-size: 50px; }
          body { font: 20px Helvetica, sans-serif; color: #333; }
          #wrapper { display: block; text-align: left; width: 650px; margin: 0 auto; }
            a { color: #dc8100; text-decoration: none; }
            a:hover { color: #333; text-decoration: none; }
            #content p {
                line-height: 1.444;
            }
            @media screen and (max-width: 768px) {
              body { text-align: center; padding: 20px; }
              h1 { font-size: 30px; }
              body { font: 20px Helvetica, sans-serif; color: #333; }
              #wrapper { display: block; text-align: left; width: 100%; margin: 0 auto; }
            }
        </style>
    </head>
    <body>
       <section id=\"wrapper\">
          <h1 style=\"color:red\">¡La App está Bloqueada!!!</h1> <div id=\"content\">
             <p>Su código de compra no es válido. Si tiene un código de compra válido, solicite uno válido aquí: <a href=\"mailto:itsolution24bd@gmail.com\">itsolution24bd@gmail.com</a> | +8801737346122</p> <p style=\"color:blue;\">&mdash; <a style=\"color:green;\" target=\"_blink\" href=\"http://harvestsnop.com\" title=\"ITsolution24.com\">ITsolution24.com</a></p> </div>
       </section>
    </body>
    </html>");
}

// Si se solicita 'check_for' con valor 'update'
if (isset($request->get['check_for']) && $request->get['check_for'] == 'update')
{
    // Mostrar mensaje de que ya está actualizado con la fecha actual
    dd('Ya Actualizado en: '.date('Y-m-d'));
}