<?php
include("_init.php");

// Maneja la solicitud POST: Restablecer Contraseña mediante el Código de Restablecimiento
if ($request->server['REQUEST_METHOD'] == 'POST' && $request->get['action_type'] == "RESET")
{
    try {
        // Verifica si se ha enviado el código de restablecimiento
        if (!isset($request->post['fp_code'])) {
            throw new Exception(trans('error_password_reset_code'));
        }

        $reset_code =  $request->post['fp_code'];

        // Valida el Código de Restablecimiento (busca usuario con código válido y no expirado)
        $statement = db()->prepare("SELECT * FROM `users` WHERE `pass_reset_code` = ? AND `reset_code_time` > NOW() - INTERVAL 1 DAY");
        $statement->execute(array($reset_code));
        $user = $statement->fetch(PDO::FETCH_ASSOC);
        if (!$user) {
            throw new Exception(trans('error_invalid_reset_code'));
        }

        // Valida la nueva contraseña
        if(empty($request->post['password'])) {
            throw new Exception(trans('error_type_a_valid_password'));
        }

        // Verifica la fortaleza de la contraseña
        if (($errMsg = checkPasswordStrongness($request->post['password'])) != 'ok') {
            throw new Exception($errMsg);
        }

        // Verifica si la contraseña y la confirmación coinciden
        if($request->post['password'] !== $request->post['password_confirm']) {
            throw new Exception(trans('error_password_not_match'));
        }

        $password = $request->post['password'];
        $password_confirm = $request->post['password_confirm'];

        // Match Password and Confirm Password (repetido, mantener el original)
        if ($password !== $password_confirm) {
            throw new Exception(trans('error_password_not_match'));
        }

        // Actualiza la Contraseña y borra el código de restablecimiento
        // NOTA DE SEGURIDAD: MD5 no es seguro para contraseñas. Guardar raw_password es un RIESGO SIGNIFICATIVO.
        $statement = db()->prepare("UPDATE `users` SET `password` = ?, `raw_password` = ?, `pass_reset_code` = ? WHERE `id` = ?");
        $statement->execute(array(md5($password), $password, '', $user['id']));

        // Responde con éxito
        header('Content-Type: application/json; charset=UTF-8');
        echo json_encode(array('msg' => trans('password_reset_success')));
        exit();

    } catch (Exception $e) {
        // Responde con error JSON
        header('HTTP/1.1 422 Unprocessable Entity');
        header('Content-Type: application/json; charset=UTF-8');
        echo json_encode(array('errorMsg' => $e->getMessage()));
        exit();
    }
}

// Maneja la solicitud GET (carga inicial de la página)
$reset_code =  $request->get['fp_code'];
// Si no hay código en la URL, redirige al inicio de sesión
if (!$reset_code) {
    redirect('index.php');
}

// Verifica si el Código de Restablecimiento de la URL existe en la DB y es válido
$statement = db()->prepare("SELECT * FROM `users` WHERE `pass_reset_code` = ? AND `reset_code_time` > NOW() - INTERVAL 1 DAY");
$statement->execute(array($reset_code));
$user = $statement->fetch(PDO::FETCH_ASSOC);
// Si el código no es válido o expiró, redirige al inicio de sesión
if (!$user) {
    redirect('index.php');
}

// Si el código es válido, el script continúa y muestra el HTML
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Restablecer Contraseña | <?php echo store('name'); ?></title>
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
        <link type="text/css" href="assets/toastr/toastr.min.css" rel="stylesheet">
        <link type="text/css" href="assets/harvestsnop/css/theme.css" rel="stylesheet">
        <link type="text/css" href="assets/harvestsnop/css/login.css" rel="stylesheet">
    <?php endif; ?>

    <?php if (DEMO || USECOMPILEDASSET) : ?>
        <script src="assets/harvestsnop/jsmin/login.js"></script>
    <?php else : ?>
        <script src="assets/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/toastr/toastr.min.js" type="text/javascript"></script>
        <script src="assets/harvestsnop/js/forgot-password.js"></script>
        <script src="assets/harvestsnop/js/login.js"></script>
    <?php endif; ?>
</head>
<body class="login-page">
<div class="hidden"><?php include('assets/harvestsnop/img/iconmin/membership/membership.svg');?></div>

<section class="login-box">
    <div class="login-logo">
        <div class="text">
            <p><strong><?php echo trans('title_reset_your_password'); ?></strong></p>
        </div>
    </div>
    <?php if (isset($error_message)) : ?>
        <div class="alert alert-danger">
            <p class=""><span class="fa fa-fw fa-warning"></span> <?php echo $error_message ; ?></p>
        </div>
        <br>
    <?php endif; ?>
    <div class="login-box-body">
        <p class="login-box-msg"><strong><?php echo trans('text_password_reset'); ?></strong></p>
        <form id="reset-form" action="passowrd_reset.php" method="post">
            <input type="hidden" name="fp_code" value="<?php echo isset($request->get['fp_code']) ? $request->get['fp_code'] : null; ?>">

            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon input-sm">
                        <svg class="svg-icon"><use href="#icon-password"></svg>
                    </div>
                    <input type="password" class="form-control" placeholder="<?php echo trans('label_new_password'); ?>" name="password">
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon input-sm">
                        <svg class="svg-icon"><use href="#icon-password"></svg>
                    </div>
                    <input type="password" class="form-control" placeholder="<?php echo trans('label_confirm_new_password'); ?>" name="password_confirm">
                </div>
            </div>

            <button type="submit" id="reset-confirm-btn" class="btn btn-success btn-block btn-flat" data-loading-text="Espere Restableciendo..."><i class="fa fa-fw fa-sign-in"></i> <?php echo trans('button_password_reset'); ?></button>
            <input type="hidden" name="action_type" value="RESET">
        </form>
    </div>
    <div class="copyright text-center">
        <p>&copy; harvestsnop, <?php echo date('Y'); ?></p>
    </div>
</section>

<noscript>Necesitas tener JavaScript habilitado para poder usar <strong><?php echo store('name');?></strong>.</noscript>
</body>
</html>