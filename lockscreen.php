<?php
// Inicia el buffer de salida
ob_start();
// Inicia o reanuda la sesión
session_start();
// Incluye el archivo de inicialización principal
include ("_init.php");

// Redirige si el usuario no ha iniciado sesión (o si la sesión no está completa)
if (!isset($session->data['username'])) {
    // Si la sesión del nombre de usuario no está definida, verifica si el usuario está logueado de alguna otra forma
    if (!$user->isLogged()) {
        // Si NO está logueado en absoluto, redirige a la página principal de login, pasando la URL actual para redireccionar después
        redirect(root_url() . '/index.php?redirect_to=' . url());
    }
    // Si el usuario SÍ está logueado (pero la sesión no se cargó completamente), recarga algunos datos en la sesión
    $session->data['email'] = user('email');
    $session->data['username'] = user('username');
    // Mantiene la URL de referencia si ya está en la sesión, de lo contrario la deja vacía
    $session->data['ref_url'] = isset($session->data['ref_url']) ? $session->data['ref_url'] : '';
    // ***** Nota: Esta línea parece contra-intuitiva ya que acaba de verificar que isLogged() es true *****
    // ***** Podría ser una lógica para forzar una re-autenticación aunque la sesión exista parcialmente *****
    $user->logout(); // Cierra la sesión actual (preparando para la re-autenticación en esta página)
}

// Inicializa una variable para almacenar mensajes de error
$error = '';
// Maneja la solicitud POST cuando se envía el formulario de la pantalla de bloqueo (se envía la contraseña)
if ($request->server['REQUEST_METHOD'] == 'POST' && isset($request->post['password'])) {
    try {

        // Valida que la contraseña no esté vacía
        if (!$request->post['password']) {
            throw new Exception(trans('error_invalid_password')); // Lanza excepción si está vacía
        }

        // Valida que el nombre de usuario esté en la sesión (debería estar si pasó la verificación inicial)
        if (!$session->data['username']) {
            throw new Exception(trans('error_invalid_username')); // Lanza excepción si falta el nombre de usuario en sesión
        }

        // Obtiene el correo electrónico y la contraseña (la contraseña viene del POST, el email de la sesión)
        $email = $session->data['email'];
        $password = $request->post['password'];

        // Intenta iniciar sesión nuevamente con el email de la sesión y la contraseña enviada
        if ($user->login($email, $password)) {
            // Si el login es exitoso:
            // Determina la URL a la que redirigir (la URL de referencia guardada o el dashboard por defecto)
            $url = $session->data['ref_url'] ? $session->data['ref_url'] : root_url() . '/administrador/dashboard.php';
            // Redirige al usuario a la URL determinada
            redirect($url);
        }

        // Si el login falla, establece un mensaje de error
        $error = trans('error_invalid_username_or_password');

    } catch (Exception $e) {
        // Si ocurre una excepción durante el proceso, establece el mensaje de error de la excepción
        $error = $e->getMessage();
    }
}
?>
<!DOCTYPE html>
<html lang="<?php echo $document->langTag($active_lang);?>">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo trans('text_lockscreen');?><?php echo ' | '.store('name') ? store('name') : ''; ?></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <?php if ($store->get('favicon')): ?>
        <link rel="shortcut icon" href="assets/itsolution24/img/logo-favicons/<?php echo $store->get('favicon'); ?>">
    <?php else: ?>
        <link rel="shortcut icon" href="assets/harvestsnop/img/logo-favicons/nofavicon.png">
    <?php endif; ?>

    <?php if (DEMO || USECOMPILEDASSET) : ?>
        <link type="text/css" href="assets/harvestsnop/cssmin/login.css" rel="stylesheet">

    <?php else : ?>
        <link type="text/css" href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">

        <link type="text/css" href="assets/perfectScroll/css/perfect-scrollbar.css" rel="stylesheet">

        <link type="text/css" href="assets/toastr/toastr.min.css" rel="stylesheet">

        <link type="text/css" href="assets/harvestsnop/css/theme.css" rel="stylesheet">

        <link type="text/css" href="assets/harvestsnop/css/login.css" rel="stylesheet">

    <?php endif; ?>

    <script type="text/javascript">
        var baseUrl = "<?php echo root_url(); ?>"; // URL raíz de la aplicación
        var adminDir = "<?php echo ADMINDIRNAME; ?>"; // Nombre del directorio admin
        // URL de referencia guardada en la sesión
        var refUrl = "<?php echo isset($session->data['ref_url']) ? $session->data['ref_url'] : ''?>";
    </script>

    <?php if (DEMO || USECOMPILEDASSET) : ?>
        <script src="assets/harvestsnop/jsmin/login.js"></script>

    <?php else : ?>
        <script src="assets/jquery/jquery.min.js" type="text/javascript"></script>

        <script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

        <script src="assets/perfectScroll/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>

        <script src="assets/toastr/toastr.min.js" type="text/javascript"></script>

        <script src="assets/harvestsnop/js/common.js"></script>

        <script src="assets/harvestsnop/js/login.js"></script>

    <?php endif; ?>

</head>
<body class="lockscreen">

<?php if ($error):?>
    <div class="alert alert-danger text-center" style="padding:5px;">
        <?php echo $error;?> </div>
<?php endif;?>

<div class="lockscreen-wrapper">
    <h4 class="text-center text-green">MODERN POS <small class="text-muted">v<?php echo settings('version');?></small></h4>
    <br>
    <div class="lockscreen-name"><?php echo $session->data['username'];?></div>
    <div class="lockscreen-item">
        <div class="lockscreen-image">
            <?php if (get_the_user(1, 'user_image') && ((FILEMANAGERPATH && is_file(FILEMANAGERPATH.get_the_user(1, 'user_image')) && file_exists(FILEMANAGERPATH.get_the_user(1, 'user_image'))) || (is_file(DIR_STORAGE . 'users' . get_the_user(1, 'user_image')) && file_exists(DIR_STORAGE . 'users' . get_the_user(1, 'user_image'))))) : ?>
                <div class="user-thumbnail">
                    <img  src="<?php echo FILEMANAGERURL ? FILEMANAGERURL : root_url().'/storage/users'; ?>/<?php echo get_the_user(1, 'user_image'); ?>" style="max-width:100%;max-height:100%;">
                </div>
            <?php else : ?>
                <img src="<?php echo root_url();?>/assets/harvestsnop/img/nopeople.png">
            <?php endif; ?>
        </div>
        <form class="lockscreen-credentials" action="" method="post" autocomplete="on">
            <div class="input-group">
                <input class="form-control" type="password" name="password" placeholder="contraseña" autocomplete="off" autofocus> <div class="input-group-btn">
                    <button type="submit" class="btn">&rarr;</button>
                </div>
            </div>
        </form>
    </div>
    <div class="help-block text-center">
        Ingrese su contraseña para recuperar su sesión
    </div>
    <div class="text-center">
        <a href="index.php" style="font-size:1.8rem;color:green;text-decoration:underline;"><small>o</small> Iniciar sesión como un usuario diferente</a> </div>
    <div class="lockscreen-footer text-center">
        <div class="copyright" style="font-size:1.2rem;">Copyright © Harvestsnop <?php echo date('Y'); ?> <a href="">www.harvestsnop.com</a></div>
    </div>
</div>

<noscript>Necesitas tener JavaScript habilitado para poder usar <strong><?php echo store('name');?></strong>.</noscript> </body>
</html>