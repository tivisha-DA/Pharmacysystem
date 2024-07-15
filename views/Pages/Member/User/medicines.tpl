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
				<strong>List of Medicines</strong>
			</li>
		</ol>		
		
		<h2>List of Medicines</h2>
		<br>
		
		{$flash}
		<table class="table table-bordered table-striped datatable">
				<thead>
					<tr>
						<th>No.</th>
						<th>Name</th>
						<th>Price</th>
						<th>Unit</th>
						<th>Created</th>
						<th>Action</th>
					</tr>
				</thead>
				
				<tbody>
					{foreach $medicines as $id => $row }
						<tr>
							<td>{$row@iteration}</td>
							<td>{$row.name}</td>
							<td>RM{$row.price|number_format:2}</td>
							<td>{$row.unit|default:'-'}</td>
							<td>{$row.created}</td>
							<td>
								<button class="btn btn-info btn-sm btn-icon icon-left btn-view" data-id="{$id}"><i class="entypo-info"></i>View</button>
							</td>
						</tr>
					{/foreach}
				</tbody>
		</table>
		
		<br />
		<!-- Footer -->
		{include file='Elements/member_bottombar.tpl'}
	</div>
	{* Modal for CRUD functionality *}
	<!-- View Form-->
		<div class="modal fade" id="view-medicine">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">View Medicine</h4>
					</div>
					<form method="POST" action="make_payment.php">
						<input type="hidden" name="id" value="">
						<div class="modal-body">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-3 control-label">Name</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input name="name" type="text" class="form-control" disabled>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Price</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">RM</span>
											<input name="price" type="text" class="form-control" disabled>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Unit Type</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input name="unit" type="text" class="form-control" disabled>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Quantity</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input name="quantity" type="number" class="form-control" min="1" value="1">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Payment Total</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">RM</span>
											<input name="payment_total" type="number" class="form-control" readonly>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Pharmacy</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input type="text" name="pharmacy" class="form-control">
										</div>
									</div>
								</div>
								<style type="text/css">
									button.pharmacy-location { width: 100%; };
								</style>
								<div class="form-group">
									<div class="col-md-offset-3 col-sm-9">
										{foreach $pharmacies as $id => $row}
											<button type="button" class="btn btn-white btn-sm pharmacy-location" data-id="">{$row.name} - {$row.location}</button>
										{/foreach}
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success btn-sm btn-icon icon-left btn-order" data-id=""><i class="entypo-basket"></i>Order</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
	<script>listOfMedicines = {json_encode($medicines)};</script>
	{literal}
	<script>
			function send_form_via_ajax( form ) {
				var data = $(form).serialize();
				send_data_via_ajax( data );
			}
			function send_data_via_ajax( data ) {
				console.log( data );
				$.post( '', data,function( response ){
					console.log( response );
					// if ( response.result ) {
						// location.reload(true);
					// }
				}, 'text');
			}
			function calculate_payment_total() {
				var price = $( '#view-medicine input[name=price]' ).val(),
					quantity = $( '#view-medicine input[name=quantity]' ).val();
					paymentTotal = price * quantity;

				$( '#view-medicine input[name=payment_total]' ).val( paymentTotal.toFixed(2) );
			}
			function displayMedicineDataInForm( medicineID, form ) {
				var medicine = listOfMedicines[ medicineID ];
				form.find( 'input,select' ).each(function(){
					var input = $(this),
						name = input.attr( 'name' );
						if ( name == 'action' || name == 'quantity' ) return;// exclude input hidden named 'action, quantity'
						
					input.val( medicine[ name ] );
					if ( name == 'price' ) {
						input.val(Number(input.val()).toFixed(2));
					}
				});
				calculate_payment_total();
			}
			$(document).ready(function(){ //----------------------------------------------------------------------------------------
				// Text input's event for current's pharmacy location
					$( '#view-medicine input[name=pharmacy]' ).keyup(function(){

					});


				// Calculation
					$( '#view-medicine input[name=quantity]' ).on( 'change keyup', function(){
						calculate_payment_total();
					});


				// For modal functionality
					$( '.btn-view' ).click(function(e){
							var medicineID = $(this).data( 'id' ),
								form = $( '#view-medicine form' );
							displayMedicineDataInForm( medicineID, form );
							$( '#view-medicine' ).modal( 'show' );
						e.preventDefault();
					});

				// For AJAX functionality
					// $( '#add-medicine, #edit-medicine' ).find( 'form' ).submit(function(e){
					// 	send_form_via_ajax( this );
					// 	e.preventDefault();
					// });
					// $( '.btn-delete' ).click(function(e){
					// 	if( !confirm('Do you really want to delete this medicine?') ) return;
					// 	var medicineID = $(this).data( 'id' );
					// 	send_data_via_ajax({ id:medicineID,action: 'delete' });
					// 	e.preventDefault();
					// });

					// $( '#view-medicine' ).find( '.btn-order' ).click(function(){
					// 	var form = $( '#view-medicine' ).find( 'form' );
					// 	var id = form.find( 'input[name=id]' ).val();
					// 	var quantity = form.find( 'input[name=quantity]' ).val();
						
					// 	send_data_via_ajax({ id:id, quantity: quantity,action: 'order' });
					// });
			});//-------------------------------------------------------------------------------------------------------------------
	</script>
	{/literal}
{/block}