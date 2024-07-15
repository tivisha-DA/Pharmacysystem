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
				<strong>List of Orders</strong>
			</li>
		</ol>		
		
		<h2>List of Orders</h2>
		<br>
		
		{$flash}
		<table class="table table-bordered table-striped datatable">
				<thead>
					<tr>
						<th>Order ID</th>
						<th>Buyer</th>
						<th>Medicine</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Payment Total</th>
						<th>Payment Status</th>
						<th>Delivered</th>
						<th>Created</th>
						<th>Action</th>
					</tr>
				</thead>
				
				<tbody>
					{foreach $orders as $id => $row }
						{$status = [
									'<div class="label label-warning">Waiting</div>',
									'<div class="label label-success">Success</div>',
									'<div class="label label-primary"></div>',
									'<div class="label label-danger">Failed</div>'
									]}
						{$delivered = [ 'Pending', 'In-Progress', 'Completed' ]}
						<tr>
							<td>#{$id}</td>
							<td>{$row->user.username}</td>
							<td>{$row->medicine.name}</td>
							<td>RM{$row->medicine.price|number_format:2}</td>
							<td>{$row.quantity}</td>
							<td>RM{$row.payment_total|number_format:2}</td>
							<td>{$status[$row.payment_status]}</td>
							<td>{$delivered[$row.delivered]}</td>
							<td>{$row.created}</td>
							<td>
								<a href="delivery.php?order_id={$id}" class="btn btn-default btn-sm btn-icon icon-left btn-delivery" data-id="{$id}"><i class="entypo-rocket"></i>Delivery</a>
								
								<button class="btn btn-info btn-sm btn-icon icon-left btn-review" data-id="{$id}"><i class="entypo-comment"></i>Review</button>
							</td>
						</tr>
					{/foreach}
				</tbody>
		</table>
		<br />
		<br />
		<br />
		<!-- Footer -->
		{include file='Elements/member_bottombar.tpl'}
	</div>
	{* Modal for CRUD functionality *}
	<!-- Review Form-->
		<div class="modal fade" id="review-data">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Leave A Review For Order</h4>
					</div>
					<form method="POST">
						<input type="hidden" name="action" value="review">
						<input type="hidden" name="id" value="">
						<div class="modal-body">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-3 control-label">Review</label>
									<div class="col-sm-9">
										<textarea name="review" class="form-control" rows="5"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-info"><i class="entypo-paper-plane"></i> Send</button>
						</div>
					</form>
				</div>
			</div>
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
					null,
					null,
					null,
					// { "width": "30%" },
					null,
					null,
					null,
					null
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
	<script>listOfDatas = {json_encode($orders)};</script>
	{literal}
	<script>
			function send_form_via_ajax( form ) {
				var data = $(form).serialize();
				send_data_via_ajax( data );
			}
			function send_data_via_ajax( data ) {
				console.log( data );
				$.post( '', data,function( response ){
					// console.log( response );
					// if ( response.result ) {
						location.reload(true);
					// }
				}, 'text');
			}
			function disabledIfNotEmpty( form ) {
				var reviewInput = form.find( 'textarea[name=review]' ),
					submitBtn = form.find( 'button[type=submit]' );
				if ( reviewInput.val() ) {
					reviewInput.prop( 'disabled', true );
					submitBtn.prop( 'disabled', true );
				} else {
					reviewInput.prop( 'disabled', false );
					submitBtn.prop( 'disabled', false );
				}
			}
			function displayDataInForm( id, form ) {
				var data = listOfDatas[ id ];
				form.find( 'input,select,textarea' ).each(function(){
					var input = $(this),
						name = input.attr( 'name' );
						if ( name == 'action' ) return;// exclude input hidden named 'action'
					input.val( data[ name ] );
				});

				disabledIfNotEmpty( form );
			}
			$(document).ready(function(){ //----------------------------------------------------------------------------------------
				// For modal functionality
					$( '.btn-review' ).click(function(e){
							var id = $(this).data( 'id' ),
								form = $( '#review-data form' );
							displayDataInForm( id, form );
							$( '#review-data' ).modal( 'show' );
						e.preventDefault();
					});

				// For AJAX functionality
					$( '#review-data' ).find( 'form' ).submit(function(e){
						send_form_via_ajax( this );
						e.preventDefault();
					});
			});//-------------------------------------------------------------------------------------------------------------------
	</script>
	{/literal}
{/block}