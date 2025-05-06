<?php
// Incluye el archivo de configuración principal
require_once("config.php");
// Incluye funciones de ayuda comunes
require_once("_inc/helper/common.php");
// Incluye funciones de ayuda para manejo de archivos
require_once("_inc/helper/file.php");
// Incluye funciones de ayuda para red/conexiones
require_once("_inc/helper/network.php");

// Verifica si la solicitud proviene de localhost
if (isLocalhost()) {
    // Si es de localhost, devuelve un error JSON y sale
    echo json_encode(array(
        'status' => 'error', // Estado: error
        'message' => 'Acción inválida', // Mensaje: Acción inválida (traducido)
        'for' => 'invalid', // Propósito: inválido
    ));
    exit(); // Sale del script
};

// Función para validar el acceso a la API usando usuario y contraseña
function validateApiAccess($username, $password) {
    // Lista de clientes válidos con sus contraseñas (credenciales hardcodeadas)
    $valid_clients = array(
        'harvestsnop' => array( // Nombre de usuario válido
            'password' => '1993' // Contraseña asociada
        ),
    );
    // Verifica si el nombre de usuario existe en la lista y si la contraseña proporcionada coincide
    return isset($valid_clients[$username]) && ($valid_clients[$username]['password'] == $password);
}

// Obtiene el cuerpo de la solicitud POST en formato raw (php://input)
// y lo decodifica de JSON a un array PHP
$post_data     = json_decode(file_get_contents('php://input'), true);
// Obtiene el valor de la clave 'action' del array decodificado, si existe
$action        = isset($post_data['action']) ? $post_data['action'] : null;
// Obtiene el valor de la clave 'data' del array decodificado, si existe
// y lo decodifica nuevamente de JSON a un array (asume que 'data' contiene un string JSON)
$query_data     = isset($post_data['data']) ? json_decode($post_data['data'],true) : null;

// Verifica si faltan el nombre de usuario o la contraseña en los datos recibidos
if (!isset($post_data['username']) || !isset($post_data['password'])) {
    // Si faltan, devuelve un error JSON y sale
    echo json_encode(array(
        'status' => 'error', // Estado: error
        'message' => 'Acción inválida', // Mensaje: Acción inválida (traducido)
        'for' => 'invalid', // Propósito: inválido
    ));
    exit(); // Sale del script
}

// Valida las credenciales de acceso usando la función validateApiAccess
if (!validateApiAccess($post_data['username'], $post_data['password'])) {
    // Si las credenciales son inválidas, devuelve un error JSON y sale
    echo json_encode(array(
        'status' => 'error', // Estado: error
        'message' => 'Acción inválida', // Mensaje: Acción inválida (traducido)
        'for' => 'invalid', // Propósito: inválido
    ));
    exit(); // Sale del script
}

// Estructura switch para manejar diferentes acciones de API
switch ($action) {
    case 'sync': // Caso para la acción 'sync' (sincronización)

        // Intenta iniciar una conexión a la base de datos usando pdo_start() (asume que está definida en _init.php o config.php)
        try {
            $db = pdo_start();
        }
        catch(PDOException $e) {
            // Si hay un error de conexión a la base de datos, devuelve un error JSON y sale
            echo json_encode(array(
                'status' => 'error', // Estado: error
                'message' => 'Error de conexión a la base de datos: '.$e->getMessage(), // Mensaje traducido con detalle del error
                'for' => 'invalid', // Propósito: inválido
            ));
            exit(); // Sale del script
        }

        // Itera sobre los datos de consulta recibidos ($query_data)
        // Asume que $query_data es un array de arrays, donde cada uno tiene 'sql' y 'args'
        foreach ($query_data as $sql) {
            // Prepara la sentencia SQL para su ejecución
            $statement = $db->prepare($sql['sql']);
            // Ejecuta la sentencia SQL, pasando los argumentos para evitar inyección SQL
            $statement->execute($sql['args']);
        }

        // Si la sincronización se completa sin errores, devuelve un mensaje de éxito JSON
        echo json_encode(array(
            'status' => 'success', // Estado: éxito
            'message' => 'Sincronización realizada con éxito', // Mensaje traducido
            'for' => 'sync', // Propósito: sincronización
        ));
        break; // Sale del switch

    default: // Caso por defecto si la acción no es reconocida
        // Devuelve un error JSON indicando que la acción es inválida
        echo json_encode(array(
            'status' => 'error', // Estado: error
            'message' => 'Acción inválida', // Mensaje: Acción inválida (traducido)
            'for' => 'invalid', // Propósito: inválido
        ));
        break; // Sale del switch
}