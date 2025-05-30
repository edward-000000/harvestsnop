<?php
ob_start();
session_start();
include ("../_init.php");

// Redirigir si el usuario no ha iniciado sesión
if (!is_loggedin()) {
    redirect(root_url() . '/index.php?redirect_to=' . url());
}

// Redirigir si el usuario no tiene permiso de lectura
if (user_group_id() != 1 && !has_permission('access', 'read_bank_account')) {
    redirect(root_url() . '/'.ADMINDIRNAME.'/dashboard.php');
}

// Establecer el título del documento
$document->setTitle(trans('title_bank_account'));

// Añadir Script
$document->addScript('../assets/harvestsnop/angular/controllers/BankAccountController.js');

// Incluir Encabezado y Pie de página
include("header.php");
include ("left_sidebar.php") ;
?>

    <div class="content-wrapper" ng-controller="BankAccountController">

        <section class="content-header">
            <h1>
                <?php echo trans('text_bank_account_title'); ?>
                <small>
                    <?php echo store('name'); ?>
                </small>
            </h1>
            <ol class="breadcrumb">
                <li>
                    <a href="dashboard.php">
                        <i class="fa fa-dashboard"></i>
                        <?php echo trans('text_dashboard'); ?>
                    </a>
                </li>
                <li>
                    <?php if (isset($request->get['box_state']) && $request->get['box_state']=='open'): ?>
                        <a href="cuenta_banco.php"><?php echo trans('text_bank_account_title'); ?></a>
                    <?php else: ?>
                        <?php echo trans('text_bank_account_title'); ?>
                    <?php endif; ?>
                </li>
                <?php if (isset($request->get['box_state']) && $request->get['box_state']=='open'): ?>
                    <li class="active">
                        <?php echo trans('text_add'); ?>
                    </li>
                <?php endif; ?>
            </ol>
        </section>
        <section class="content">

            <?php // *** Se ha eliminado el bloque de advertencia de DEMO *** ?>

            <?php if (user_group_id() == 1 || has_permission('access', 'create_bank_account')) : ?>
                <div class="box box-info<?php echo create_box_state(); ?>">
                    <div class="box-header with-border">
                        <h3 class="box-title">
                            <span class="fa fa-fw fa-plus"></span> <?php echo trans('text_new_bank_account_title'); ?>
                        </h3>
                        <button type="button" class="btn btn-box-tool add-new-btn" data-widget="collapse" data-collapse="true">
                            <i class="fa <?php echo !create_box_state() ? 'fa-minus' : 'fa-plus'; ?>"></i>
                        </button>
                    </div>
                    <?php if (isset($error_message)): ?>
                        <div class="alert alert-danger">
                            <p>
                                <span class="fa fa-warning"></span>
                                <?php echo $error_message ; ?>
                            </p>
                        </div>
                    <?php elseif (isset($success_message)): ?>
                        <div class="alert alert-success">
                            <p>
                                <span class="fa fa-check"></span>
                                <?php echo $success_message ; ?>
                            </p>
                        </div>
                    <?php endif; ?>

                    <?php include('../_inc/template/bank_account_create_form.php'); ?>

                </div>
            <?php endif; ?>

            <div class="row">

                <div class="col-xs-12">
                    <div class="box box-success">
                        <div class="box-header">
                            <h3 class="box-title">
                                <?php echo trans('text_bank_account_list_title'); ?>
                            </h3>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive">
                                <?php
                                $hide_colums = "";
                                if (user_group_id() != 1) {
                                    if (! has_permission('access', 'update_bank_account')) {
                                        $hide_colums .= "4,";
                                    }
                                    if (! has_permission('access', 'delete_bank_account')) {
                                        $hide_colums .= "5,";
                                    }
                                }
                                ?>
                                <table id="account-list" class="table table-bordered table-striped table-hover" data-hide-colums="<?php echo $hide_colums; ?>">
                                    <thead>
                                    <tr class="bg-gray">
                                        <th class="w-5" >
                                            <?php echo sprintf(trans('label_id'), null); ?>
                                        </th>
                                        <th class="w-25" >
                                            <?php echo trans('label_account_name'); ?>
                                        </th>
                                        <th class="w-40">
                                            <?php echo trans('label_account_description'); ?>
                                        </th>
                                        <th class="w-10">
                                            <?php echo trans('label_status'); ?>
                                        </th>
                                        <th class="w-10">
                                            <?php echo trans('label_edit'); ?>
                                        </th>
                                        <th class="w-10">
                                            <?php echo trans('label_delete'); ?>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr class="bg-gray">
                                        <th>
                                            <?php echo sprintf(trans('label_id'), null); ?>
                                        </th>
                                        <th>
                                            <?php echo trans('label_account_name'); ?>
                                        </th>
                                        <th>
                                            <?php echo trans('label_account_description'); ?>
                                        </th>
                                        <th>
                                            <?php echo trans('label_status'); ?>
                                        </th>
                                        <th>
                                            <?php echo trans('label_edit'); ?>
                                        </th>
                                        <th>
                                            <?php echo trans('label_delete'); ?>
                                        </th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<?php include ("footer.php"); ?>