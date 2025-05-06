<?php
ob_start();
session_start();
include realpath(__DIR__.'/../').'/_init.php';


// Redirigir si el usuario no ha iniciado sesión
if (!is_loggedin()) {
    redirect(root_url() . '/index.php?redirect_to=' . url());
}

// Establecer el título del documento
$document->setTitle(trans('title_dashboard'));

// Añadir Scripts
$document->addScript('../assets/harvestsnop/angular/controllers/DashboardController.js');
$document->addScript('../assets/harvestsnop/angular/controllers/ReportCollectionController.js');
$document->addScript('../assets/harvestsnop/angular/modals/QuotationViewModal.js');

// Añadir clase al BODY
$document->setBodyClass('dashboard');
$banking_model = registry()->get('loader')->model('banking');

// Incluir Encabezado y Pie de página
include ("header.php");
include ("left_sidebar.php");
?>

    <div class="content-wrapper" ng-controller="DashboardController">

        <section class="content-header">
            <?php include ("../_inc/template/partials/apply_filter.php"); ?>
            <h1>
                <?php echo trans('text_dashboard'); ?>
                <small>
                    <?php echo store('name'); ?>
                </small>
            </h1>
        </section>
        <section class="content">

            <?php // *** Se ha eliminado el bloque de advertencias de DEMO y actualización *** ?>

            <div class="hidden-xs action-button-sm">
                <?php include '../_inc/template/partials/action_buttons.php'; ?>
            </div>

            <hr>

            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div id="invoice-count" class="small-box bg-green">
                        <div class="inner">
                            <h4>
                                <i><?php echo trans('text_total_invoice'); ?></i> <span class="total-invoice"><?php echo number_format(total_invoice(from(), to())); ?></span>
                            </h4>
                            <h4>
                                <i><?php echo trans('text_total_invoice_today'); ?></i> <span class="total-invoice"><?php echo number_format(total_invoice_today()); ?></span>
                            </h4>
                        </div>
                        <div class="icon">
                            <i class="fa fa-pencil"></i>
                        </div>
                        <?php if (user_group_id() == 1 || has_permission('access', 'read_customer')) : ?>
                            <a href="invoice.php" class="small-box-footer">
                                <?php echo trans('text_details'); ?>
                                <i class="fa fa-arrow-circle-right"></i>
                            </a>
                        <?php else:?>
                            <a href="#" class="small-box-footer">
                                &nbsp;
                            </a>
                        <?php endif;?>
                    </div>
                </div>
                <div class="col-md-3 col-xs-6">
                    <div id="customer-count" class="small-box bg-red">
                        <div class="inner">
                            <h4>
                                <i><?php echo trans('text_total_customer'); ?></i> <span class="total-customer"><?php echo number_format(total_customer(from(), to())); ?></span>
                            </h4>
                            <h4>
                                <i><?php echo trans('text_total_customer_today'); ?></i> <span class="total-customer"><?php echo number_format(total_customer_today()); ?></span>
                            </h4>
                        </div>
                        <div class="icon">
                            <i class="fa fa-users"></i>
                        </div>
                        <?php if (user_group_id() == 1 || has_permission('access', 'read_customer')) : ?>
                            <a href="customer.php" class="small-box-footer">
                                <?php echo trans('text_details'); ?>
                                <i class="fa fa-arrow-circle-right"></i>
                            </a>
                        <?php else:?>
                            <a href="#" class="small-box-footer">
                                &nbsp;
                            </a>
                        <?php endif;?>
                    </div>
                </div>
                <div class="col-md-3 col-xs-6">
                    <div id="supplier-count" class="small-box bg-purple">
                        <div class="inner">
                            <h4>
                                <i><?php echo trans('text_total_supplier'); ?></i> <span class="total-suppier"><?php echo total_supplier(from(), to()); ?></span>
                            </h4>
                            <h4>
                                <i><?php echo trans('text_total_supplier_today'); ?></i> <span class="total-suppier"><?php echo total_supplier_today(); ?></span>
                            </h4>
                        </div>
                        <div class="icon">
                            <i class="fa fa-fw fa-shopping-cart"></i>
                        </div>
                        <?php if (user_group_id() == 1 || has_permission('access', 'read_supplier')) : ?>
                            <a href="supplier.php" class="small-box-footer">
                                <?php echo trans('text_details'); ?>
                                <i class="fa fa-arrow-circle-right"></i>
                            </a>
                        <?php else:?>
                            <a href="#" class="small-box-footer">
                                &nbsp;
                            </a>
                        <?php endif;?>
                    </div>
                </div>
                <div class="col-md-3 col-xs-6">
                    <div id="product-count" class="small-box bg-yellow">
                        <div class="inner">
                            <h4>
                                <i><?php echo trans('text_total_product'); ?></i> <span class="total-product"><?php echo number_format(total_product(from(), to())); ?></span>
                            </h4>
                            <h4>
                                <i><?php echo trans('text_total_product_today'); ?></i> <span class="total-product"><?php echo number_format(total_product_today()); ?></span>
                            </h4>
                        </div>
                        <div class="icon">
                            <i class="fa fa-star"></i>
                        </div>
                        <?php if (user_group_id() == 1 || has_permission('access', 'read_product')) : ?>
                            <a href="product.php" class="small-box-footer">
                                <?php echo trans('text_details'); ?>
                                <i class="fa fa-arrow-circle-right"></i>
                            </a>
                        <?php else:?>
                            <a href="#" class="small-box-footer">
                                &nbsp;
                            </a>
                        <?php endif;?>
                    </div>
                </div>
            </div>
        </section>
    </div>
<?php include ("footer.php"); ?>