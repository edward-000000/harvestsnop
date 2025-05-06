<?php
// Incluye el archivo de inicialización (puede cargar configuraciones básicas)
include ("_init.php");
// Verifica si el archivo .maintenance NO existe en la raíz del proyecto
if (!file_exists(ROOT.DIRECTORY_SEPARATOR.'.maintenance')) {
    // Si el archivo .maintenance no existe, redirige al usuario a index.php
    header('Location: index.php', true, 302); // Código de estado 302 para redirección temporal
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8">
    <title>Mantenimiento del Sitio</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <style type="text/css">
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
<section id="wrapper">
    <h1>Restableciendo, por favor espere...</h1>
    <div id="content">
        <p>El sistema restablecerá los datos de modern pos a los valores por defecto. Por favor, tenga un poco de paciencia. ¡Volveremos en línea pronto!</p>
        <p>&mdash; <a target="_blink" href="" title="">harvestsnop.com</a></p>
        <p>&mdash; <a target="_blink" href="" title="">harvestsnop.com</a></p>
    </div>
</section>
</body>
</html>