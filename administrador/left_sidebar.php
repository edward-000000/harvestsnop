<aside class="main-sidebar">
  <section class="sidebar">

    <!--  Sidebar User Panel Start-->
    <div class="user-panel">
      <div class="pull-left image">
        <?php if (get_the_user(user_id(), 'user_image') && ((FILEMANAGERPATH && is_file(FILEMANAGERPATH.get_the_user(user_id(), 'user_image')) && file_exists(FILEMANAGERPATH.get_the_user(user_id(), 'user_image'))) || (is_file(DIR_STORAGE . 'users' . get_the_user(user_id(), 'user_image')) && file_exists(DIR_STORAGE . 'users' . get_the_user(user_id(), 'user_image'))))) : ?>
          <div class="user-thumbnail">
            <a href="user_profile.php?id=<?php echo user_id();?>">
              <img  src="<?php echo FILEMANAGERURL ? FILEMANAGERURL : root_url().'/storage/users'; ?>/<?php echo get_the_user(user_id(), 'user_image'); ?>" style="max-width:100%;max-height:100%;">
            </a>
          </div>
        <?php else : ?>
          <svg class="svg-icon"><use href="#icon-avatar"></svg>
        <?php endif; ?>
      </div>
      <div class="pull-left info">
        <p class="username" title="<?php echo $user->getUserName(); ?>">
          <?php echo ucfirst(limit_char($user->getUserName(), 15)); ?>
        </p>
        <a href="user_profile.php?id=<?php echo user_id();?>">
          <i class="fa fa-circle user-status-dot"></i> 
          <?php echo limit_char($user->getRole(), 14); ?> 
        </a>
      </div>
    </div>  
    <!-- Sidebar User Panel End -->

    <!-- Sidebar Menu Start -->
    <ul class="sidebar-menu">
      <li class="<?php echo current_nav() == 'administrador' || current_nav() == 'dashboard' ? ' active' : null; ?>">
        <a href="dashboard.php">
          <svg class="svg-icon"><use href="#icon-dashboard"></svg>
          <span>
            <?php echo trans('menu_dashboard'); ?>
          </span>
        </a>
      </li>

      <?php if (user_group_id() == 1 || has_permission('access', 'create_sell_invoice')) : ?>
        <li class="<?php echo current_nav() == 'pos' ? 'active' : null; ?>">
          <a href="pos.php">
            <svg class="svg-icon"><use href="#icon-create-invoice"></svg>
            <span>
              <?php echo trans('menu_point_of_sell'); ?>
            </span>
          </a>
        </li>
      <?php endif; ?>

      <li class="treeview<?php echo current_nav() == 'pos' || current_nav() == 'invoice' || current_nav() == 'sell_return' || current_nav() == 'sell_log' || current_nav() == 'giftcard' || current_nav() == 'giftcard_topup' ? ' active' : null; ?>">
        <?php if(user_group_id() == 1 || has_permission('access', 'read_sell_list') ||  has_permission('access', 'read_sell_return') ||  has_permission('access', 'read_sell_log') ||  has_permission('access', 'read_giftcard') ||  has_permission('access', 'add_giftcard') ||  has_permission('access', 'read_giftcard_topup')): ?>
        <a href="pos.php">
          <svg class="svg-icon"><use href="#icon-money"></svg>
          <span><?php echo trans('menu_sell'); ?></span>
           <i class="fa fa-angle-left pull-right"></i>
         </a>
        <?php endif; ?>
        <ul class="treeview-menu">
          <?php if (user_group_id() == 1 || has_permission('access', 'read_sell_list')) : ?>
            <li class="<?php echo current_nav() == 'invoice' ? ' active' : null; ?>">
              <a href="invoice.php" title="<?php echo trans('text_invoice'); ?>">
                <svg class="svg-icon"><use href="#icon-invoice-list"></svg>
                <span>
                  <?php echo trans('menu_sell_list'); ?>
                </span>
              </a>
            </li>
          <?php endif; ?>
          <?php if (user_group_id() == 1 || has_permission('access', 'read_sell_return')) : ?>
            <li class="<?php echo (current_nav() == 'sell_return') ? 'active' : null; ?>">
              <a href="sell_return.php">
                <svg class="svg-icon"><use href="#icon-back-arrow"></svg>
                <span>
                  <?php echo trans('menu_return_list'); ?>
                </span>
              </a>
            </li>
          <?php endif; ?>
          <?php if (user_group_id() == 1 || has_permission('access', 'read_sell_log')): ?>
            <li class="<?php echo current_nav() == 'sell_log' ? ' active' : null; ?>">
              <a href="sell_log.php">
                <svg class="svg-icon"><use href="#icon-list"></svg>
                 <?php echo trans('menu_sell_log'); ?>
              </a>
            </li>
          <?php endif; ?>
          <li class="treeview<?php echo current_nav() == 'giftcard' || current_nav() == 'giftcard_topup' ? ' active' : null; ?>">
            <?php if(user_group_id() == 1 || has_permission('access', 'read_giftcard') || has_permission('access', 'add_giftcard') || has_permission('access', 'read_giftcard_topup')): ?>
            <a href="giftcard.php">
              <svg class="svg-icon"><use href="#icon-card1"></svg>
              <span><?php echo trans('menu_giftcard'); ?></span>
               <i class="fa fa-angle-left pull-right"></i>
             </a>
            <?php endif; ?>
            <ul class="treeview-menu">
              <?php if (user_group_id() == 1 || has_permission('access', 'add_giftcard')) : ?>
                <li class="<?php echo current_nav() == 'giftcard' && isset($request->get['box_state']) ? 'active' : null; ?>">
                  <a href="giftcard.php?box_state=open">
                    <svg class="svg-icon"><use href="#icon-plus"></svg>
                    <span>
                      <?php echo trans('menu_add_giftcard'); ?>
                    </span>
                  </a>
                </li>
              <?php endif; ?>
              <?php if (user_group_id() == 1 || has_permission('access', 'read_giftcard')) : ?>
                <li class="<?php echo current_nav() == 'giftcard' && !isset($request->get['box_state'])? 'active' : null; ?>">
                  <a href="giftcard.php">
                    <svg class="svg-icon"><use href="#icon-card1"></svg>
                    <span>
                      <?php echo trans('menu_giftcard_list'); ?>
                    </span>
                  </a>
                </li>
              <?php endif; ?>
              <?php if (user_group_id() == 1 || has_permission('access', 'read_giftcard_topup')) : ?>
                <li class="<?php echo current_nav() == 'giftcard_topup' ? 'active' : null; ?>">
                  <a href="giftcard_topup.php">
                    <svg class="svg-icon"><use href="#icon-list"></svg>
                    <span>
                      <?php echo trans('menu_giftcard_topup'); ?>
                    </span>
                  </a>
                </li>
              <?php endif; ?>
            </ul>
          </li>
        </ul>
      </li>

      <?php if (user_group_id() == 1 || has_permission('access', 'read_quotation')) : ?>
        <li class="treeview<?php echo current_nav() == 'quotation' || current_nav() == 'quotation_list' ||  current_nav() == 'quotation_edit' ? ' active' : null; ?>">
          <?php if(user_group_id() == 1 || has_permission('access', 'read_quotation') || has_permission('access', 'create_quotation')): ?>
          <a href="quotation.php">
            <svg class="svg-icon"><use href="#icon-heart"></svg>
            <span><?php echo trans('menu_quotation'); ?></span>
             <i class="fa fa-angle-left pull-right"></i>
           </a>
          <?php endif; ?>
          <ul class="treeview-menu">
            <?php if (user_group_id() == 1 || has_permission('access', 'create_quotation')) : ?>
              <li class="<?php echo current_nav() == 'quotation' && isset($request->get['box_state']) ? 'active' : null; ?>">
                <a href="quotation.php?box_state=open">
                  <svg class="svg-icon"><use href="#icon-plus"></svg>
                  <span>
                    <?php echo trans('menu_add_quotation'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_quotation')) : ?>
              <li class="<?php echo current_nav() == 'quotation' && !isset($request->get['box_state']) ? 'active' : null; ?>">
                <a href="quotation.php">
                  <svg class="svg-icon"><use href="#icon-list"></svg>
                  <span>
                    <?php echo trans('menu_quotation_list'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
          </ul>
        </li>
      <?php endif; ?>

      <?php if (INSTALLMENT && (user_group_id() == 1 || has_permission('access', 'create_installment'))):?>
        <li class="treeview<?php echo current_nav() == 'installment' || current_nav() == 'installment_payment' || current_nav() == 'installment_overview' ? ' active' : null; ?>">
          <?php if(user_group_id() == 1 || has_permission('access', 'read_installment') || has_permission('access', 'installment_payment') || has_permission('access', 'installment_payment') || has_permission('access', 'installment_overview')): ?>
          <a href="installment.php">
            <svg class="svg-icon"><use href="#icon-installment"></svg>
            <span><?php echo trans('menu_installment'); ?></span>
             <i class="fa fa-angle-left pull-right"></i>
           </a>
          <?php endif; ?>
          <ul class="treeview-menu">
            <?php if (user_group_id() == 1 || has_permission('access', 'read_installment')) : ?>
              <li class="<?php echo current_nav() == 'installment' ? 'active' : null; ?>">
                <a href="installment.php">
                  <svg class="svg-icon"><use href="#icon-list"></svg>
                  <span>
                    <?php echo trans('menu_installment_list'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'installment_payment')) : ?>
              <li class="<?php echo current_nav() == 'installment_payment' && isset($request->get['type']) && $request->get['type'] == 'all_payment' ? 'active' : null; ?>">
                <a href="installment_payment.php?type=all_payment">
                  <svg class="svg-icon"><use href="#icon-list"></svg>
                  <span>
                    <?php echo trans('menu_payment_list'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'installment_payment')) : ?>
              <li class="<?php echo current_nav() == 'installment_payment' && isset($request->get['type']) && $request->get['type'] == 'todays_due_payment' ? 'active' : null; ?>">
                <a href="installment_payment.php?type=todays_due_payment">
                  <svg class="svg-icon"><use href="#icon-money"></svg>
                  <span>
                    <?php echo trans('menu_payment_due_today'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'installment_payment')) : ?>
              <li class="<?php echo current_nav() == 'installment_payment' && isset($request->get['type']) && $request->get['type'] == 'all_due_payment' ? 'active' : null; ?>">
                <a href="installment_payment.php?type=all_due_payment">
                  <svg class="svg-icon"><use href="#icon-money"></svg>
                  <span>
                    <?php echo trans('menu_payment_due_all'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'installment_payment')) : ?>
              <li class="<?php echo current_nav() == 'installment_payment' && isset($request->get['type']) && $request->get['type'] == 'expired_due_payment' ? 'active' : null; ?>">
                <a href="installment_payment.php?type=expired_due_payment">
                  <svg class="svg-icon"><use href="#icon-expired"></svg>
                  <span>
                    <?php echo trans('menu_payment_due_expired'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'installment_overview')) : ?>
              <li class="<?php echo current_nav() == 'installment_overview' ? 'active' : null; ?>">
                <a href="installment_overview.php">
                  <svg class="svg-icon"><use href="#icon-eye"></svg>
                  <span>
                    <?php echo trans('menu_overview_report'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
          </ul>
        </li>
      <?php endif;?>

      <?php if (user_group_id() == 1 || has_permission('access', 'read_purchase_list') || has_permission('access', 'create_purchase_invoice') || has_permission('access', 'read_purchase_return') || has_permission('access', 'read_purchase_log')) : ?>
        <li class="treeview<?php echo current_nav() == 'purchase' || current_nav() == 'purchase_return' || current_nav() == 'purchase_log' ? ' active' : null; ?>">
          <?php if(user_group_id() == 1 || has_permission('access', 'read_purchase_list') || has_permission('access', 'create_purchase_invoice') || has_permission('access', 'read_purchase_return')) : ?>
          <a href="purchage_list.php">
            <svg class="svg-icon"><use href="#icon-shopping-bag"></svg>
            <span><?php echo trans('menu_purchase'); ?></span>
             <i class="fa fa-angle-left pull-right"></i>
           </a>
          <?php endif; ?>
          <ul class="treeview-menu">
            <?php if (user_group_id() == 1 || has_permission('access', 'create_purchase_invoice')) : ?>
              <li class="<?php echo current_nav() == 'purchase' && isset($request->get['box_state']) ? 'active' : null; ?>">
                <a href="purchase.php?box_state=open">
                  <svg class="svg-icon"><use href="#icon-plus"></svg>
                  <span>
                    <?php echo trans('menu_add_purchase'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_purchase_list')) : ?>
              <li class="<?php echo current_nav() == 'purchase' && !isset($request->get['box_state']) && !(isset($request->get['type']) && $request->get['type'] == 'due') ? 'active' : null; ?>">
                <a href="purchase.php">
                  <svg class="svg-icon"><use href="#icon-list"></svg>
                  <span>
                    <?php echo trans('menu_purchase_list'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_purchase_list')) : ?>
              <li class="<?php echo (current_nav() == 'purchase') && isset($request->get['type']) && $request->get['type'] == 'due' ? 'active' : null; ?>">
                <a href="purchase.php?type=due">
                  <svg class="svg-icon"><use href="#icon-money"></svg>
                  <span>
                    <?php echo trans('menu_due_invoice'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_purchase_return')) : ?>
              <li class="<?php echo (current_nav() == 'purchase_return') ? 'active' : null; ?>">
                <a href="purchase_return.php">
                  <svg class="svg-icon"><use href="#icon-back-arrow"></svg>
                  <span>
                    <?php echo trans('menu_return_list'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_purchase_log')): ?>
              <li class="<?php echo current_nav() == 'purchase_log' ? ' active' : null; ?>">
                <a href="purchase_log.php">
                  <svg class="svg-icon"><use href="#icon-list"></svg>
                   <?php echo trans('menu_purchase_logs'); ?>
                </a>
              </li>
            <?php endif; ?>
          </ul>
        </li>
      <?php endif; ?>

      <?php if (user_group_id() == 1 || has_permission('access', 'read_transfer')) : ?>
        <li class="treeview<?php echo current_nav() == 'transfer' || current_nav() == 'transfer_add' ? ' active' : null; ?>">
          <a href="transfer.php">
            <svg class="svg-icon"><use href="#icon-transfer"></svg>
            <span>
              <?php echo trans('menu_transfer'); ?>
            </span> 
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <?php if (user_group_id() == 1 || has_permission('access', 'add_transfer') || has_permission('access', 'update_transfer')): ?>
              <li class="<?php echo current_nav() == 'transfer' && isset($request->get['box_state']) ? ' active' : null; ?>">
                <a href="transfer.php?box_state=open">
                  <svg class="svg-icon"><use href="#icon-plus"></svg>
                   <?php echo trans('menu_add_transfer'); ?>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_transfer')): ?>
              <li class="<?php echo current_nav() == 'transfer' && !isset($request->get['box_state']) && !isset($request->get['type']) ? ' active' : null; ?>">
                <a href="transfer.php">
                  <svg class="svg-icon"><use href="#icon-transfer"></svg>
                  <?php echo trans('menu_transfer_list'); ?>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_transfer')): ?>
              <li class="<?php echo current_nav() == 'transfer' && isset($request->get['type']) && $request->get['type'] == 'receive' && !isset($request->get['box_state']) ? ' active' : null; ?>">
                <a href="transfer.php?type=receive">
                  <svg class="svg-icon"><use href="#icon-plus"></svg>
                  <?php echo trans('menu_receive_list'); ?>
                </a>
              </li>
            <?php endif; ?>
          </ul>
        </li>
      <?php endif; ?>

      <?php if (user_group_id() == 1 || has_permission('access', 'read_product')) : ?>
        <li class="treeview<?php echo current_nav() == 'product' || current_nav() == 'product_details' || current_nav() == 'barcode_print' || current_nav() == 'category' || current_nav() == 'import_product' || current_nav() == 'stock_alert' || current_nav() == 'expired' ? ' active' : null; ?>">
          <a href="product.php">
            <svg class="svg-icon"><use href="#icon-star"></svg>
            <span>
              <?php echo trans('menu_product'); ?>
            </span> 
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <?php if (user_group_id() == 1 || has_permission('access', 'read_product')): ?>
              <li class="<?php echo (current_nav() == 'product' && !isset($request->get['box_state'])) || current_nav() == 'product_details' ? ' active' : null; ?>">
                <a href="product.php">
                  <svg class="svg-icon"><use href="#icon-list"></svg>
                  <?php echo trans('menu_product_list'); ?>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_product')): ?>
              <li class="<?php echo current_nav() == 'product' && isset($request->get['box_state']) ? ' active' : null; ?>">
                <a href="product.php?box_state=open">
                  <svg class="svg-icon"><use href="#icon-plus"></svg>
                  <?php echo trans('menu_add_product'); ?>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'barcode_print')): ?>
              <li class="<?php echo current_nav() == 'barcode_print' ? ' active' : null; ?>">
                <a href="barcode_print.php">
                  <svg class="svg-icon"><use href="#icon-barcode"></svg>
                  <?php echo trans('menu_barcode_print'); ?>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_category')): ?>
              <li class="<?php echo current_nav() == 'category' && !isset($request->get['box_state']) ? ' active' : null; ?>">
                <a href="category.php">
                  <svg class="svg-icon"><use href="#icon-category"></svg>
                   <?php echo trans('menu_category'); ?>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'crate_category')): ?>
              <li class="<?php echo current_nav() == 'category' && isset($request->get['box_state']) ? ' active' : null; ?>">
                <a href="category.php?box_state=open">
                  <svg class="svg-icon"><use href="#icon-plus"></svg>
                   <?php echo trans('menu_add_category'); ?>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'import_product')): ?>
              <li class="<?php echo current_nav() == 'import_product' ? ' active' : null; ?>">
                <a href="import_product.php">
                  <svg class="svg-icon"><use href="#icon-import"></svg>
                  <?php echo trans('menu_product_import'); ?>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_stock_alert')): ?>
              <li class="<?php echo current_nav() == 'stock_alert' ? ' active' : null; ?>">
                <a href="stock_alert.php">
                  <svg class="svg-icon"><use href="#icon-alert"></svg>
                  <?php echo trans('menu_stock_alert'); ?>
                  <?php if (total_out_of_stock() > 0) : ?>
                    <span class="label label-danger bg-yellow">
                      <?php echo total_out_of_stock(); ?>
                    </span>
                  <?php endif; ?>
                </a>
              </li>
            <?php endif; ?>
            <?php if (get_preference('expiry_yes') && (user_group_id() == 1 || has_permission('access', 'read_expired_product'))): ?>
              <li class="<?php echo current_nav() == 'expired' ? ' active' : null; ?>">
                <a href="expired.php">
                  <svg class="svg-icon"><use href="#icon-expired"></svg>
                  <?php echo trans('menu_expired'); ?>
                  <?php if (total_expired() > 0) : ?>
                    <span class="label label-warning bg-yellow">
                      <?php echo total_expired(); ?>
                    </span>
                  <?php endif; ?>
                </a>
              </li>
            <?php endif; ?>
          </ul>
        </li>
      <?php endif; ?>

      <?php if (user_group_id() == 1 || has_permission('access', 'read_customer') || has_permission('access', 'read_customer_transaction')) : ?>
        <li class="treeview<?php echo current_nav() == 'customer' || current_nav() == 'customer_profile' || current_nav() == 'customer_transaction' ? ' active' : null; ?>">
          <a href="customer.php">
            <svg class="svg-icon"><use href="#icon-group"></svg>
            <span>
              <?php echo trans('menu_customer'); ?>
            </span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <?php if (user_group_id() == 1 || has_permission('access', 'create_customer')): ?>
              <li class="<?php echo current_nav() == 'customer' && isset($request->get['box_state']) ? ' active' : null; ?>">
                <a href="customer.php?box_state=open">
                  <svg class="svg-icon"><use href="#icon-plus"></svg>
                  <span>
                    <?php echo trans('menu_add_customer'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_customer')): ?>
              <li class="<?php echo current_nav() == 'customer'  && !isset($request->get['box_state']) ? ' active' : null; ?>">
                <a href="customer.php">
                  <svg class="svg-icon"><use href="#icon-group"></svg>
                  <span>
                    <?php echo trans('menu_customer_list'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <!-- <?php if (user_group_id() == 1 || has_permission('access', 'read_customer_transaction')): ?>
              <li class="<?php echo current_nav() == 'customer_transaction' ? ' active' : null; ?>">
                <a href="customer_transaction.php">
                  <svg class="svg-icon"><use href="#icon-list"></svg>
                   <?php echo trans('menu_statements'); ?>
                </a>
              </li>
            <?php endif; ?> -->
          </ul>
        </li>
      <?php endif; ?>

      <?php if (user_group_id() == 1 || has_permission('access', 'read_supplier')) : ?>
        <li class="treeview<?php echo current_nav() == 'supplier' || current_nav() == 'supplier_profile' ? ' active' : null; ?>">
          <a href="supplier.php">
            <svg class="svg-icon"><use href="#icon-supplier"></svg>
            <span>
              <?php echo trans('menu_supplier'); ?>
            </span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <?php if (user_group_id() == 1 || has_permission('access', 'create_supplier')): ?>
              <li class="<?php echo current_nav() == 'supplier' && isset($request->get['box_state']) ? ' active' : null; ?>">
                <a href="supplier.php?box_state=open">
                  <svg class="svg-icon"><use href="#icon-plus"></svg>
                  <span>
                    <?php echo trans('menu_add_supplier'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_supplier')): ?>
              <li class="<?php echo current_nav() == 'supplier'  && !isset($request->get['box_state']) ? ' active' : null; ?>">
                <a href="supplier.php">
                  <svg class="svg-icon"><use href="#icon-group"></svg>
                  <span>
                    <?php echo trans('menu_supplier_list'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
          </ul>
        </li>
      <?php endif; ?>

      <?php if (user_group_id() == 1 || has_permission('access', 'read_user') || has_permission('access', 'read_usergroup') || has_permission('access', 'change_password')) : ?>
        <li class="treeview<?php echo current_nav() == 'user' || current_nav() == 'user_group' || current_nav() == 'password' ? ' active' : null; ?>">
          <a href="user.php">
            <svg class="svg-icon"><use href="#icon-user"></svg>
            <span>
              <?php echo trans('menu_user'); ?>
            </span> 
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <?php if (user_group_id() == 1 || has_permission('access', 'create_user')) : ?>
              <li class="<?php echo current_nav() == 'user'  && isset($request->get['box_state']) ? 'active' : null; ?>">
                <a href="user.php?box_state=open">
                  <svg class="svg-icon"><use href="#icon-plus"></svg>
                  <span>
                    <?php echo trans('menu_add_user'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_user')) : ?>
              <li class="<?php echo current_nav() == 'user'  && !isset($request->get['box_state']) ? 'active' : null; ?>">
                <a href="user.php">
                  <svg class="svg-icon"><use href="#icon-list"></svg>
                  <span>
                    <?php echo trans('menu_user_list'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'create_usergroup')) : ?>
              <li class="<?php echo current_nav() == 'user_group' && isset($request->get['box_state']) ? 'active' : null; ?>">
                <a href="user_group.php?box_state=open">
                  <svg class="svg-icon"><use href="#icon-plus"></svg>
                  <span>
                    <?php echo trans('menu_add_usergroup'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if (user_group_id() == 1 || has_permission('access', 'read_usergroup')) : ?>
              <li class="<?php echo current_nav() == 'user_group'  && !isset($request->get['box_state']) ? 'active' : null; ?>">
                <a href="user_group.php">
                  <svg class="svg-icon"><use href="#icon-list"></svg>
                  <span>
                    <?php echo trans('menu_usergroup_list'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
            <?php if ((user_group_id() == 1 || has_permission('access', 'change_password')) && !DEMO) : ?>
              <li class="<?php echo current_nav() == 'password' ? 'active' : null; ?>">
                <a href="password.php">
                  <svg class="svg-icon"><use href="#icon-password"></svg>
                  <span>
                    <?php echo trans('menu_password'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>
          </ul>
        </li>
      <?php endif; ?>

      <?php if ((user_group_id() == 1 || has_permission('access', 'read_filemanager')) && !DEMO) : ?>
        <li class="<?php echo current_nav() == 'filemanager' ? 'active' : null; ?>">
          <a href="filemanager.php">
            <svg class="svg-icon"><use href="#icon-folder"></svg>
            <span>
              <?php echo trans('menu_filemanager'); ?>
            </span>
          </a>
        </li>
      <?php endif; ?>

      <?php if (user_group_id() == 1 || has_permission('access', 'read_store') || has_permission('access', 'receipt_template') || has_permission('access', 'read_user_preference') || has_permission('access', 'read_unit') || has_permission('access', 'read_taxrate') || has_permission('access', 'read_pmethod') || has_permission('access', 'read_currency') || has_permission('access', 'read_brand') || has_permission('access', 'read_box') || has_permission('access', 'read_printer') || has_permission('access', 'sms_setting') || has_permission('access', 'backup') || has_permission('access', 'language_translation')) : ?>

        <li class="treeview<?php echo current_nav() == 'store' || current_nav() == 'receipt_template' || current_nav() == 'store_create' || current_nav() == 'user_preference' || current_nav() == 'store_single' || current_nav() == 'brand' || current_nav() == 'currency' || current_nav() == 'pmethod' || current_nav() == 'unit' || current_nav() == 'taxrate' || current_nav() == 'box' || current_nav() == 'printer' || current_nav() == 'sms_setting' || current_nav() == 'backup_restore' || current_nav() == 'language' ? ' active' : null; ?>">
          
          <a href="store_single.php">
            <svg class="svg-icon"><use href="#icon-settings"></svg>
            <span>
              <?php echo trans('menu_system'); ?>
            </span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          
          <ul class="treeview-menu">

            <?php if (user_group_id() == 1 || has_permission('access', 'read_store')) : ?>
              <li class="treeview<?php echo current_nav() == 'store' || current_nav() == 'store_create' || current_nav() == 'store_single' ? ' active' : null; ?>">
                <a href="store.php">
                  <svg class="svg-icon"><use href="#icon-list"></svg>
                  <span>
                    <?php echo trans('menu_store'); ?>
                  </span>
                  <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <?php if (user_group_id() == 1 || has_permission('access', 'create_store')): ?>
                    <li class="<?php echo current_nav() == 'store_create' ? ' active' : null; ?>">
                      <a href="store_create.php">
                        <svg class="svg-icon"><use href="#icon-plus"></svg>
                        <?php echo trans('menu_create_store'); ?>
                      </a>
                    </li>
                  <?php endif; ?>
                  <?php if (user_group_id() == 1 || has_permission('access', 'read_store')): ?>
                    <li class="<?php echo current_nav() == 'store' ? ' active' : null; ?>">
                      <a href="store.php">
                        <svg class="svg-icon"><use href="#icon-list"></svg>
                        <?php echo trans('menu_store_list'); ?>
                      </a>
                    </li>
                  <?php endif; ?>
                  <?php if (user_group_id() == 1 || has_permission('access', 'read_store')) : ?>
                    <li class="<?php echo current_nav() == 'store_single' ? 'active' : null; ?>">
                      <a href="store_single.php">
                        <svg class="svg-icon"><use href="#icon-settings"></svg>
                        <span>
                          <?php echo trans('menu_store_setting'); ?>
                        </span>
                      </a>
                    </li>
                  <?php endif; ?>
                </ul>
              </li>
            <?php endif; ?>

            <?php if (user_group_id() == 1 || has_permission('access', 'read_brand')) : ?>
              <li class="treeview<?php echo current_nav() == 'brand' || current_nav() == 'brand_profile' ? ' active' : null; ?>">
                <a href="brand.php">
                  <svg class="svg-icon"><use href="#icon-brand"></svg>
                  <span>
                    <?php echo trans('menu_brand'); ?>
                  </span>
                  <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <?php if (user_group_id() == 1 || has_permission('access', 'create_brand')): ?>
                    <li class="<?php echo current_nav() == 'brand' && isset($request->get['box_state']) ? ' active' : null; ?>">
                      <a href="brand.php?box_state=open">
                        <svg class="svg-icon"><use href="#icon-plus"></svg>
                        <span>
                          <?php echo trans('menu_add_brand'); ?>
                        </span>
                      </a>
                    </li>
                  <?php endif; ?>
                  <?php if (user_group_id() == 1 || has_permission('access', 'read_brand')): ?>
                    <li class="<?php echo current_nav() == 'brand'  && !isset($request->get['box_state']) ? ' active' : null; ?>">
                      <a href="brand.php">
                        <svg class="svg-icon"><use href="#icon-list"></svg>
                        <span>
                          <?php echo trans('menu_brand_list'); ?>
                        </span>
                      </a>
                    </li>
                  <?php endif; ?>
                </ul>
              </li>
            <?php endif; ?>



            <?php if (user_group_id() == 1 || has_permission('access', 'read_pmethod')) : ?>
              <li class="<?php echo current_nav() == 'pmethod' ? 'active' : null; ?>">
                <a href="pmethod.php">
                  <svg class="svg-icon"><use href="#icon-money"></svg>
                  <span>
                    <?php echo trans('menu_pmethod'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>

            <?php if (user_group_id() == 1 || has_permission('access', 'read_unit')) : ?>
              <li class="<?php echo current_nav() == 'unit' ? 'active' : null; ?>">
                <a href="unit.php">
                  <svg class="svg-icon"><use href="#icon-unit"></svg>
                  <span>
                    <?php echo trans('menu_unit'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>

            <?php if (user_group_id() == 1 || has_permission('access', 'read_taxrate')) : ?>
              <li class="<?php echo current_nav() == 'taxrate' ? 'active' : null; ?>">
                <a href="taxrate.php">
                  <svg class="svg-icon"><use href="#icon-money"></svg>
                  <span>
                    <?php echo trans('menu_taxrate'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>

            <?php if (user_group_id() == 1 || has_permission('access', 'read_box')) : ?>
              <li class="<?php echo current_nav() == 'box' ? 'active' : null; ?>">
                <a href="box.php">
                  <svg class="svg-icon"><use href="#icon-box"></svg>
                  <span>
                    <?php echo trans('menu_box'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>

            <?php if (user_group_id() == 1 || has_permission('access', 'read_printer')) : ?>
              <li class="<?php echo current_nav() == 'printer' ? 'active' : null; ?>">
                <a href="printer.php">
                  <svg class="svg-icon"><use href="#icon-printer"></svg>
                  <span>
                    <?php echo trans('menu_printer'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>


            <?php if ((user_group_id() == 1 || has_permission('access', 'backup') || has_permission('access', 'restore')) && !DEMO) : ?>
              <li class="<?php echo current_nav() == 'backup_restore' ? 'active' : null; ?>">
                <a href="restauracion_copia_seguridad.php">
                  <svg class="svg-icon"><use href="#icon-backup"></svg>
                  <span>
                    <?php echo trans('menu_backup_restore'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>

            <?php if ((user_group_id() == 1 || has_permission('access', 'reset')) && !DEMO) : ?>
              <li class="<?php echo current_nav() == 'reset' ? 'active' : null; ?>">
                <a href="reset.php">
                  <svg class="svg-icon"><use href="#icon-minus"></svg>
                  <span>
                    <?php echo trans('menu_data_reset'); ?>
                  </span>
                </a>
              </li>
            <?php endif; ?>

          </ul>
        </li>
      <?php endif; ?>


      <li id="sidebar-bottom"></li>
    </ul>
    
  </section>
</aside>