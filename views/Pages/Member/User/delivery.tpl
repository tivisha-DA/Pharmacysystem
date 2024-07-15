{extends file="Layouts/member.tpl"}
{block name=body}
	<div class="main-content">
				
		{include file='Elements/member_topbar.tpl'}
		{$page = $page|capitalize|replace:'_':' '}
		
		<ol class="breadcrumb bc-3" >
			<li>
				<a href="#"><i class="fa fa-home"></i>Home</a>
			</li>
			<li>
				<a href="#">Pages</a>
			</li>
			<li class="active">
				<strong>Delivery Tracking</strong>
			</li>
		</ol>		
		
		<h2>Delivery Tracking: For Order #{$order_id}</h2>
		<br>
		
		{$flash}
		<table class="table table-bordered table-striped datatable">
				<thead>
					<tr>
						<th>No.</th>
						<th>Location</th>
						<th>Created</th>
					</tr>
				</thead>
				
				<tbody>
					{foreach $delivery as $id => $row }
						{$status = [
									'<div class="label label-warning">Waiting</div>',
									'<div class="label label-success">Success</div>',
									'<div class="label label-primary"></div>',
									'<div class="label label-danger">Failed</div>'
									]}
						{$delivered = [ 'Pending', 'In-Progress', 'Completed' ]}
						<tr>
							<td>{$row@iteration}</td>
							<td>{$row.location}</td>
							<td>{$row.created}</td>
						</tr>
					{/foreach}
				</tbody>
		</table>
		<br />
		<a href="orders.php" class="btn btn-primary">
			<i class="entypo-back"></i> Back
		</a>

		<br />
		<br />
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
						"aoColumns": [
					// { "bSortable": false },
					null,
					null,
					null,
				],
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