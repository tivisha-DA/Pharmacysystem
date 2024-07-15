{$title = 'Dashboard'}
{extends file="Layouts/member.tpl"}
{block name=body}
	<div class="main-content">
	
		{include file='Elements/member_topbar.tpl'}	
		<div class="row">

			<div class="col-md-12 col-xs-12">
				<blockquote class="blockquote-default">
					<h1 class="h1">
						<strong>Welcome To OPS</strong>
						<span class="badge badge-primary" style="font-size:25px;">
							<i class="fa fa-heartbeat"></i>
						</span>
					</h1>
				</blockquote>
				
			</div>
			
			<div class="clear visible-xs"></div>
		</div>
		<br>

		<div class="row">
			<div class="col-sm-4">
			
				<a href="medicines.php" class="tile-title tile-green">
					
					<div class="icon">
						<i class="glyphicon glyphicon-leaf"></i>
					</div>
					
					<div class="title">
						<h3>List of Medicines</h3>
						<p>-</p>
					</div>
				</a>
				
			</div>
			
			<div class="col-sm-4">
				<a href="orders.php" class="tile-title tile-primary">
					<div class="icon">
						<i class="glyphicon glyphicon-shopping-cart"></i>
					</div>
					<div class="title">
						<h3>List of Orders</h3>
						<p>-</p>
					</div>
				</a>
			</div>
			
			<div class="col-sm-4">
				<a href="customer_support.php" class="tile-title tile-blue">
					<div class="icon">
						<i class="glyphicon glyphicon-question-sign"></i>
					</div>
					<div class="title">
						<h3>Customer Support</h3>
						<p>-</p>
					</div>
				</a>
			</div>
		</div>
		<br />
		
		<!-- Footer -->
		{include file='Elements/member_bottombar.tpl'}
	</div>
{/block}
{block name=scripts}
	<script type="text/javascript">
		$.noConflict();
		jQuery( document ).ready( function( $ ) {
			var table = $( '.datatable' );
			
			// Initialize DataTable
			datatable = table.DataTable( {
				"aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"bStateSave": true
			});
			
			// Initalize Select Dropdown after DataTables is created
			table.closest( '.dataTables_wrapper' ).find( 'select' ).select2( {
				minimumResultsForSearch: -1
			});

			table.closest( '.dataTables_wrapper' ).addClass( 'table-responsive' );
		} );
	</script>
{/block}