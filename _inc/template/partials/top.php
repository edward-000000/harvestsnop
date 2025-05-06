<header class="main-header">
    <a href="dashboard.php" class="logo">
    <span class="logo-mini">
      <b title="<?php echo store('name');?>">
        <?php echo store('name')[0]; ?>
      </b>
      <?php echo mb_substr(store('name'), -1); ?>
    </span>
        <span class="logo-lg">
      <b title="<?php echo store('name');?>">
        <?php echo limit_char(store('name'), 20); ?>
      </b>
    </span>
    </a>
    <nav class="navbar navbar-static-top" role="navigation">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">#</span>
        </a>

        <!-- navbar custome menu start -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <?php if (in_array(current_nav(), array('invoice','product_details','report_collection','sell_return','purchase_return','report_sell_itemwise','report_sell_categorywise','report_sell_supplierwise','report_purchase_itemwise','report_purchase_categorywise','report_purchase_supplierwise','report_customer_due_collection','report_payment','expense','expense_monthwise','income_monthwise','supplier_profile','customer_profile','report_overview', 'report_income_and_expense', 'report_profit_and_loss', 'report_customer_due_collection', 'report_supplier_due_paid', 'analysis','bank_transactions','bank_transfer','sms_report', 'loan', 'loan_summary', 'purchase','report_sell_tax', 'report_sell_payment','report_purchase_payment','report_purchase_tax','report_tax_overview','giftcard_topup','purchase_log','sell_log','customer_transaction','installment','report_cashbook', 'quotation', 'installment_payment'))) : ?>
                    <?php if (user_group_id() == 1 || has_permission('access', 'filtering')) : ?>
                        <li class="user user-menu">
                            <a id="show-filter-box" href="#">
                                <svg class="svg-icon"><use href="#icon-search-<?php echo $user->getPreference('base_color', 'black'); ?>"></svg>
                            </a>
                        </li>
                    <?php endif; ?>
                <?php endif; ?>
                <?php if (user_group_id() == 1 || has_permission('access', 'create_sell_invoice')) : ?>
                    <li class="user user-menu<?php echo current_nav() == 'pos' ? ' active' : null; ?> sell-btn">
                        <a href="pos.php" title="<?php echo trans('text_pos'); ?>">
                            <svg class="svg-icon"><use href="#icon-pos-<?php echo $user->getPreference('base_color', 'black'); ?>"></svg>
                            <span class="text">
                <?php echo trans('menu_pos'); ?>
              </span>
                        </a>
                    </li>
                <?php endif; ?>
                <?php if (current_nav() == 'pos') : ?>
                    <li>
                        <a id="keyboard-shortcut" ng-click="keyboardShortcutModal()" onClick="return false;" href="#" title="<?php echo trans('text_keyboard_shortcut'); ?>">
                            <svg class="svg-icon"><use href="#icon-keyboard-<?php echo $user->getPreference('base_color', 'black'); ?>"></svg>
                        </a>
                    </li>
                <?php endif; ?>
                <?php if (current_nav() == 'pos') : ?>
                    <?php if (user_group_id() == 1 || has_permission('access', 'read_holding_order')) : ?>
                        <li>
                            <a id="holding-order" ng-click="holdingOrderDetailsModal()" onClick="return false;" href="#" title="<?php echo trans('text_holding_order'); ?>">
                                <svg class="svg-icon"><use href="#icon-hold-<?php echo $user->getPreference('base_color', 'b'); ?>"></svg>
                                &nbsp;<span class="label label-warning"><?php echo total_holding_order_today();?></span>
                            </a>
                        </li>
                    <?php endif; ?>
                <?php endif; ?>
                <li id="screen-lock" class="user user-menu">
                    <a href="../lockscreen.php" title="<?php echo trans('text_lockscreen'); ?>">
                        <i class="fa fa-lock"></i>
                    </a>
                </li>
                <li class="user user-menu">
                    <a id="logout" href="logout.php" title="<?php echo trans('text_logout'); ?>">
                        <i class="fa fa-sign-out"></i>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</header>