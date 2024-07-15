{if $user.role == 0 } {* User *}
	{$active = [
		'dashboard' => '',
		'medicines' => '',
		'orders' => '',
		'tracking' => '',
		'reviews' => '',
		'customer_support' => ''
	]}
{elseif $user.role == 1} {*  Admin  *}
	{$active = [
		'dashboard' => '',
		'medicines' => '',
		'orders' => '',
		'customer_support' => ''
	]}
{/if}
{$active.$page = 'active opened'}

	<div class="sidebar-menu">

		<div class="sidebar-menu-inner">
			
			<header class="logo-env">

				<!-- logo -->
				<div class="logo">
					<a href="#">
						<img class="" src="../../assets/pharmacy.png" style="width: 100px;" alt="" />
					</a>
				</div>

				<!-- logo collapse icon -->
				<div class="sidebar-collapse">
					<a href="#" class="sidebar-collapse-icon"><!-- add class "with-animation" if you want sidebar to have animation during expanding/collapsing transition -->
						<i class="entypo-menu"></i>
					</a>
				</div>

								
				<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
				<div class="sidebar-mobile-menu visible-xs">
					<a href="#" class="with-animation"><!-- add class "with-animation" to support animation -->
						<i class="entypo-menu"></i>
					</a>
				</div>

			</header>
			{* Role: User *}
				{if $user.role == '0' }
					<ul id="main-menu" class="main-menu">
						<!-- add class "multiple-expanded" to allow multiple submenus to open -->
						<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
						<!-- <li class="active opened active has-sub"> -->
						<li class="{$active.dashboard}">
							<a href="dashboard.php">
								<i class="entypo-gauge"></i>
								<span class="title">Dashboard</span>
							</a>
						</li>
						<li class="{$active.medicines}">
							<a href="medicines.php">
								<i class="entypo-gauge"></i>
								<span class="title">List of Medicines</span>
							</a>
						</li>
						<li class="{$active.orders}">
							<a href="orders.php">
								<i class="entypo-gauge"></i>
								<span class="title">List of Orders</span>
							</a>
						</li>
						{* <li class="{$active.tracking}">
							<a href="#">
								<i class="entypo-gauge"></i>
								<span class="title">Delivery Tracking</span>
							</a>
						</li>
						<li class="{$active.reviews}">
							<a href="#">
								<i class="entypo-gauge"></i>
								<span class="title">Reviews</span>
							</a>
						</li> *}
						<li class="{$active.customer_support}">
							<a href="customer_support.php">
								<i class="entypo-gauge"></i>
								<span class="title">Customer Support</span>
							</a>
						</li>
					</ul>
			{* Role: Admin *}
				{elseif $user.role == '1'}
					<ul id="main-menu" class="main-menu">
						<li class="{$active.dashboard}">
							<a href="index.php">
								<i class="entypo-gauge"></i>
								<span class="title">Dashboard</span>
							</a>
						</li>
						<li class="{$active.medicines}">
							<a href="medicines.php">
								<i class="entypo-gauge"></i>
								<span class="title">List of Medicines</span>
							</a>
						</li>
						<li class="{$active.orders}">
							<a href="orders.php">
								<i class="entypo-gauge"></i>
								<span class="title">List of Orders</span>
							</a>
						</li>
						<li class="{$active.customer_support}">
							<a href="customer_support.php">
								<i class="entypo-gauge"></i>
								<span class="title">Customer Support</span>
							</a>
						</li>
					</ul>
				{/if}
		</div>
	</div>