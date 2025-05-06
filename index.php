<<<<<<< HEAD
<?php

// Incluye el archivo de inicialización principal (carga configuración, libs, etc.)
include("_init.php");
// Establece el título del documento HTML usando una función de traducción
$document->setTitle(trans('text_login_title'));

// Verifica si el usuario ya ha iniciado sesión
if ($user->isLogged()) {
    // Si ya está logueado, redirige al panel de administración
    redirect(ADMINDIRNAME.'/dashboard.php');
}

// Función para insertar un registro de error de inicio de sesión en la base de datos
function insert_error_log()
{
    $statement = db()->prepare("INSERT INTO `login_logs` SET `ip` = ?, `status` = ?");
    $statement->execute(array(get_real_ip(), 'error')); // Registra la IP y estado 'error'
}

// Maneja la solicitud POST cuando la acción es "LOGIN"
if ($request->server['REQUEST_METHOD'] == 'POST' && $request->get['action_type'] == "LOGIN")
{
    try {
        // Verifica el total de intentos fallidos recientes para limitar accesos
        $from = date('Y-m-d H:i:s', strtotime('-'.(int)UNLOCK_ACCOUNT_AFTER.' minutes', time()));
        $to = date('Y-m-d H:i:s');
        $ip = get_real_ip();
        $statement = db()->prepare("SELECT `id` FROM `login_logs` WHERE `status` = ? AND `ip` = ? AND `created_at` >= ? AND `created_at` <= ?");
        $statement->execute(array('error', $ip, $from, $to));
        $total_try = $statement->rowCount();
        if ($total_try >= (int)TOTAL_LOGIN_TRY) {
            // Lanza una excepción indicando que se excedieron los intentos
            throw new Exception($language->get('error_login_attempts_exceeded') . '. Intente después de ' . UNLOCK_ACCOUNT_AFTER . ' minuto(s)');
        }

        // Valida campos de usuario y contraseña
        if (!isset($request->post['username']) || !isset($request->post['password'])) {
            insert_error_log();
            throw new Exception(trans('error_username_or_password'));
        }
        if (!validateString($request->post['username'])) {
            insert_error_log();
            throw new Exception(trans('error_username'));
        }
        if (empty($request->post['password'])) {
            insert_error_log();
            throw new Exception(trans('error_password'));
        }

        $username = $request->post['username'];
        $password = $request->post['password'];

        // Intenta iniciar sesión
        if ($user->login($username, $password)) {
            // Si el inicio de sesión es exitoso, registra log y actualiza último login
            $statement = db()->prepare("INSERT INTO `login_logs` SET `user_id` = ?, `username` = ?, `ip` = ?");
            $statement->execute(array(user_id(), $username, get_real_ip()));
            $statement = db()->prepare("UPDATE `users` SET `last_login` = ? WHERE `id` = ?");
            $statement->execute(array(date_time(), user_id()));
            // Elimina registros de intentos fallidos previos de esta IP
            $statement = db()->prepare("DELETE FROM `login_logs` WHERE `ip` = ? AND `status` = ?");
            $statement->execute(array(get_real_ip(), 'error'));

            // Registra IP en log si LOG está activado
            if (LOG) {
                $log_path = DIR_STORAGE . 'logs/v.txt';
                write_file($log_path, get_real_ip() . ' | ', 'a');
            }

            // Lógica para "Recordarme" con cookies
            if(!empty($_POST["remember"])) {
                setcookie ("user_login",$_POST["username"],time()+ (10 * 365 * 24 * 60 * 60));
            } else {
                if(isset($_COOKIE["user_login"])) {
                    setcookie ("user_login","");
                }
            }

            // Responde con JSON de éxito
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode(array('msg' => trans('login_success'), 'sessionUserId' => $session->data['id'], 'count_user_store' => count_user_store(), 'store_id' => $user->getSingleStoreId()));
            exit();

        }

        // Si el login falla, registra error e indica credenciales inválidas
        insert_error_log();
        throw new Exception(trans('error_invalid_username_password'));

    } catch (Exception $e) {
        // Responde con error JSON
        header('HTTP/1.1 422 Unprocessable Entity');
        header('Content-Type: application/json; charset=UTF-8');
        echo json_encode(array('errorMsg' => $e->getMessage()));
        exit();
    }
}


?>
<!DOCTYPE html>
<html lang="<?php echo $document->langTag($active_lang);?>">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo store('name') ? store('name') . ' | ' : ''; ?><?php echo trans('title_log_in');?></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <?php if ($store->get('favicon')): ?>
        <link rel="shortcut icon" href="assets/itsolution24/img/logo-favicons/<?php echo $store->get('favicon'); ?>">
    <?php else: ?>
        <link rel="shortcut icon" href="assets/harvestsnop/img/logo-favicons/nofavicon.png">
    <?php endif; ?>

    <?php // Asumiendo que no estás usando assets compilados o en modo demo ?>
    <link type="text/css" href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link type="text/css" href="assets/toastr/toastr.min.css" rel="stylesheet">
    <link type="text/css" href="assets/harvestsnop/css/theme.css" rel="stylesheet">
    <link type="text/css" href="assets/harvestsnop/css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">



    <script type="text/javascript">
        var baseUrl = "<?php echo root_url(); ?>";
        var adminDir = "<?php echo ADMINDIRNAME; ?>";
        var refUrl = "<?php echo isset($request->get['redirect_to']) ? $request->get['redirect_to'] : ''?>";
    </script>

    <?php // Asumiendo que no estás usando assets compilados o en modo demo ?>
    <script src="assets/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/toastr/toastr.min.js" type="text/javascript"></script>
    <script src="assets/harvestsnop/js/common.js"></script>
    <script src="assets/harvestsnop/js/login.js"></script>

</head>
<body class="login-page">
<div class="hidden"><?php include('assets/harvestsnop/img/iconmin/membership/membership.svg');?></div>

<section class="login-box">
    <div class="login-logo">
        <div class="text">
            <p><strong><?php echo store('name'); ?></strong></p>
        </div>
    </div>
    <?php if (isset($error_message)) : ?>
        <div class="alert alert-danger">
            <p><span class="fa fa-fw fa-warning"></span> <?php echo $error_message ; ?></p>
        </div>
        <br>
    <?php endif; ?>
    <div class="login-box-body" ng-controller="LoginController">
        <p class="login-box-msg">
            <strong><?php echo trans('text_login'); ?></strong>
        </p>
        <form id="login-form" action="login.php" method="post">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon input-sm">
                        <i class="fas fa-user"></i> <!-- Ícono de usuario -->
                    </div>
                    <input type="text" class="form-control" placeholder="Email" name="username">
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon input-sm">
                        <i class="fas fa-lock"></i> <!-- Ícono de candado -->
                    </div>
                    <input type="password" class="form-control" placeholder="Contraseña" name="password">
                </div>
            </div>

            <button type="submit" id="login-btn" class="btn btn-success btn-block btn-flat" data-loading-text="Iniciando Sesión..."> <i class="fa fa-fw fa-sign-in"></i>
                <?php echo trans('button_sign_in'); ?> </button>
            <input type="hidden" name="action_type" value="LOGIN">
        </form>
    </div>
</section>
<noscript>Necesitas tener JavaScript habilitado para poder usar <strong><?php echo store('name');?></strong>.</noscript>
</body>
</html>
=======
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Harvestsnop - Tu Tienda Virtual</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                }
            }
        }
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        /* Estilo para el fondo con una imagen adaptable */
        body {
            background-image: url('https://placehold.co/1920x1080/a0a0a0/ffffff?text=Fondo+Tienda+Virtual'); /* Reemplaza con la URL de tu imagen de fondo */
            background-size: cover; /* Asegura que la imagen cubra todo el fondo */
            background-position: center center; /* Centra la imagen */
            background-repeat: no-repeat; /* Evita que la imagen se repita */
            background-attachment: fixed; /* Fija la imagen de fondo */
            min-height: 100vh; /* Asegura que el fondo cubra al menos la altura completa */
            font-family: 'Inter', sans-serif; /* Aplica el font Inter */
        }

        /* Estilo para el overlay oscuro */
        .overlay {
            background-color: rgba(0, 0, 0, 0.5); /* Fondo oscuro semi-transparente */
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1; /* Asegura que esté sobre la imagen de fondo pero debajo del contenido */
        }

        /* Estilo para la caja de login/opciones */
        .login-box {
            background-color: rgba(255, 255, 255, 0.9); /* Fondo blanco semi-transparente */
            backdrop-filter: blur(5px); /* Efecto de desenfoque en el fondo */
            z-index: 2; /* Asegura que esté sobre el overlay */
        }

        /* Estilo para el modal/dropdown de opciones de login */
        .login-options-dropdown {
            /* Puedes estilizar este div si usas un dropdown */
        }

        /* Asegura que el contenido principal esté sobre el overlay */
        .main-content {
            position: relative;
            z-index: 2;
        }
    </style>
</head>
<body class="flex flex-col min-h-screen text-gray-800">

<div class="overlay"></div>

<div class="main-content flex-grow flex flex-col justify-center items-center p-4">

    <header class="w-full max-w-4xl text-center mb-12">
        <h1 class="text-5xl md:text-6xl font-bold text-white drop-shadow-lg">HARVESTSNOP</h1>
        <p class="text-xl md:text-2xl text-white mt-2 drop-shadow-lg">Tu Tienda Virtual</p>
    </header>

    <section class="login-box p-8 rounded-lg shadow-xl w-full max-w-sm text-center">
        <h2 class="text-2xl font-semibold mb-6">Bienvenido</h2>

        <button id="login-button" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-lg w-full transition duration-300 ease-in-out transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50">
            Iniciar Sesión
        </button>

        <div id="login-options" class="login-options-dropdown mt-6 hidden">
            <p class="text-gray-700 mb-3">Selecciona tu rol:</p>
            <a href="harvestsnop/index.php" class="block bg-gray-200 hover:bg-gray-300 text-gray-800 font-semibold py-2 px-4 rounded-md mb-2 transition duration-200 ease-in-out">
                Iniciar como Administrador
            </a>
            <a href="harvestsnop/index.php" class="block bg-gray-200 hover:bg-gray-300 text-gray-800 font-semibold py-2 px-4 rounded-md mb-2 transition duration-200 ease-in-out">
                Iniciar como Vendedor
            </a>
            <a href="harvestsnop/index.php" class="block bg-gray-200 hover:bg-gray-300 text-gray-800 font-semibold py-2 px-4 rounded-md transition duration-200 ease-in-out">
                Iniciar como Cajero
            </a>
        </div>
    </section>

</div>

<footer class="w-full text-center py-4 text-white text-sm relative z-20">
    &copy; 2023 Harvestsnop. Todos los derechos reservados.
</footer>

<script>
    // JavaScript para mostrar/ocultar las opciones de login
    const loginButton = document.getElementById('login-button');
    const loginOptions = document.getElementById('login-options');
    const loginBox = document.querySelector('.login-box'); // Obtener la caja de login

    loginButton.addEventListener('click', () => {
        // Alternar la clase 'hidden' para mostrar u ocultar las opciones
        loginOptions.classList.toggle('hidden');
    });

    // Opcional: Ocultar las opciones si se hace clic fuera de ellas
    document.addEventListener('click', (event) => {
        const isClickInsideLoginBox = loginBox.contains(event.target);
        const isLoginButton = loginButton.contains(event.target);

        if (!isClickInsideLoginBox && !isLoginButton && !loginOptions.classList.contains('hidden')) {
            loginOptions.classList.add('hidden');
        }
    });
</script>

</body>
</html>
>>>>>>> 4fae8c9a05c2bf77fe43de8e6c9585ec9abb932e
