<?php
ob_start(); // Inicia el buffer de salida
session_start(); // Inicia o reanuda la sesión
define('START', true); // Constante START
define('REFRESH', true); // Constante REFRESH
// Incluye el archivo de inicialización del instalador (o similar)
include ("install/_init.php");

// Verifica la conexión a internet general
function checkInternetConnection($domain = 'www.google.com')
{
    if($socket =@ fsockopen($domain, 80, $errno, $errstr, 30)) {
        fclose($socket);
        return true;
    }
    return false;
}

// Verifica si una URL existe o devuelve ciertos códigos HTTP (200/422)
function url_exists($url) {
    $ch = @curl_init($url);
    @curl_setopt($ch, CURLOPT_HEADER, TRUE);
    @curl_setopt($ch, CURLOPT_NOBODY, TRUE);
    @curl_setopt($ch, CURLOPT_FOLLOWLOCATION, FALSE);
    @curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
    $status = array();
    preg_match('/HTTP\/.* ([0-9]+) .*/', @curl_exec($ch) , $status);
    curl_close($ch);
    return (isset($status[1]) && ($status[1] == 200 || $status[1] == 422));
}

// Verifica la conexión al servidor de validación de harvestsnop
// Asume que la URL de validación ahora está en un dominio de harvestsnop
function checkValidationServerConnection($url = 'http://tracker.harvestsnop.com/pos33/check.php') // URL hipotética cambiada
{
    if(url_exists($url)) {
        return true;
    }
    return false;
}

// Verifica la conexión a Envato (sitio de marketplaces)
function checkEnvatoServerConnection($domain = 'www.envato.com')
{
    if($socket =@ fsockopen($domain, 80, $errno, $errstr, 30)) {
        fclose($socket);
        return true;
    }
    return false;
}

// Bloque principal: Se ejecuta SOLO si se recibe el parámetro GET 'APPID' y coincide
if (isset($_GET['APPID']) && $_GET['APPID'] == APPID) {
    // Verifica las conexiones necesarias
    if(!checkInternetConnection() || !checkValidationServerConnection() || !checkEnvatoServerConnection()) {
        die('¡Se necesita conexión a internet!'); // Mensaje traducido
    }

    // URL del servidor API remoto de harvestsnop (decodificada de base64)
    // Decodifica a: http://ob.harvestsnop.com/api_pos32.php (URL hipotética cambiada y recodificada)
    $url = base64_decode('aHR0cDovL29iLmhhcnZlc3Rzbm9wLmNvbS9hcGlfcG9zMzIucGhw');
    // Datos a enviar al servidor remoto
    $data = array(
        'username' => base64_decode('aGFydmVzdHNub3A='), // Decodifica a: harvestsnop (cambiado y recodificado)
        'password' => base64_decode('MTk3MQ=='), // Decodifica a: 1971 (se mantiene)
        'app_name' => APPNAME,
        'app_id' => APPID,
        'version' => '3.3',
        'files' => array('_init.php','network.php','ecnesil.php','revalidate.php'),
        'stock_status' => 'false',
    );
    $data_string = json_encode($data);

    // Realiza la solicitud POST al servidor remoto
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // Deshabilita verificación de certificado SSL (RIESGO DE SEGURIDAD)
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_ENCODING, 'gzip');
    curl_setopt($ch, CURLOPT_USERAGENT, isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : '');
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
            'Content-Length: ' . strlen($data_string)]
    );
    $result = json_decode(curl_exec($ch),true);

    // Procesa la respuesta y escribe los archivos si se reciben contenidos
    // NOTA IMPORTANTE: Este bloque puede SOBREESCRIBIR archivos clave del sistema con contenido del servidor remoto.
    if (isset($result['contents'])) {
        foreach ($result['contents'] as $filename => $content) {
            switch ($filename) {
                case '_init.php':
                    $file_path = ROOT.DIRECTORY_SEPARATOR.'_init.php';
                    if (file_exists($file_path)) { @unlink($file_path); }
                    $fp = fopen($file_path, 'wb');
                    fwrite($fp, $content);
                    fclose($fp);
                    break;
                case 'network.php':
                    $file_path = DIR_HELPER.DIRECTORY_SEPARATOR.'network.php';
                    if (file_exists($file_path)) { @unlink($file_path); }
                    $fp = fopen($file_path, 'wb');
                    fwrite($fp, $content);
                    fclose($fp);
                    break;
                case 'ecnesil.php': // 'license' escrito al revés
                    $file_path = DIR_INCLUDE.DIRECTORY_SEPARATOR.'ecnesil.php';
                    if (file_exists($file_path)) { @unlink($file_path); }
                    $fp = fopen($file_path, 'wb');
                    fwrite($fp, $content);
                    fclose($fp);
                    break;
                case 'revalidate.php':
                    $file_path = ROOT.DIRECTORY_SEPARATOR.'revalidate.php';
                    if (file_exists($file_path)) { @unlink($file_path); }
                    $fp = fopen($file_path, 'wb');
                    fwrite($fp, $content);
                    fclose($fp);
                    break;
                default:
                    // No hacer nada para archivos no reconocidos
                    break;
            }
        }
    } else {
        // Mensaje de error si falla la conexión o no se reciben contenidos
        die("¡No hay conexión a internet / El servidor de validación no responde!"); // Mensaje traducido
        return false;
    }

    // Redirige a la página principal después de ejecutar la lógica
    redirect('index.php');

} else {
    // Mensaje de error si se accede sin el APPID válido
    die('Acción inválida. Se requiere un APPID válido.'); // Mensaje traducido
}