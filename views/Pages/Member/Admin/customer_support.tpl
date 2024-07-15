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
				<strong>Customer Support</strong>
			</li>
		</ol>		
		
		<h2>Customer Support</h2>
		<br>
		
		{$flash}
		<table class="table table-bordered table-striped datatable">
				<thead>
					<tr>
						<th>ID</th>
						<th>Inquiry</th>
						<th>Title</th>
						<th>Created</th>
						<th>Action</th>
					</tr>
				</thead>
				
				<tbody>
					{foreach $customer_supports as $id => $row }
						<tr>
							<td>#{$id}</td>
							<td>{$row.inquiry}</td>
							<td>{$row.title}</td>
							<td>{$row.created}</td>
							<td>
								<a href="messages.php?customer_support_id={$id}" class="btn btn-primary btn-sm btn-icon icon-left btn-messages" data-id="{$id}"><i class="entypo-eye"></i>View Messages</a>
							</td>
						</tr>
					{/foreach}
				</tbody>
		</table>
		
		<br />
		<br />
		<!-- Footer -->
		{include file='Elements/member_bottombar.tpl'}
	</div>
	{* Modal for CRUD functionality *}
	<!-- Open Ticket Form-->
		<div class="modal fade" id="open-ticket">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Customer Support - New Ticket</h4>
					</div>
					<form method="POST">
						<input type="hidden" name="action" value="open-ticket">
						<div class="modal-body">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label">Inquiry :</label>
									<div class="col-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="entypo-help"></i></span>
											<input name="inquiry" type="text" class="form-control" value="">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Title :</label>
									<div class="col-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i class="entypo-tag"></i></span>
											<input name="title" type="text" class="form-control" value="">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Message :</label>
									<div class="col-sm-10">
										<textarea name="message" class="form-control" rows="5"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-info btn-icon icon-left"><i class="entypo-mail"></i>Send Message</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	<!-- View Form-->
		<div class="modal fade" id="view-customer-support">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Customer Support - View Message</h4>
					</div>
					<form method="POST">
						<div class="modal-body">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label">Message :</label>
									<div class="col-sm-10">
										<textarea name="message" class="form-control" rows="5" disabled></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Response :</label>
									<div class="col-sm-10">
										<textarea name="response" class="form-control" rows="5" disabled></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Sent Time :</label>
									<div class="col-sm-10">
										<div class="input-group">
											<div class="input-group-addon"><i class="entypo-back-in-time"></i></div>
											<input name="created" type="text" class="form-control" disabled>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Response Time :</label>
									<div class="col-sm-10">
										<div class="input-group">
											<div class="input-group-addon"><i class="entypo-back-in-time"></i></div>
											<input name="response_time" type="text" class="form-control" disabled>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
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
					null,
					// { "width": "30%" },
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
	<script>listOfCustomerSupports = {json_encode($customer_supports)};</script>
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
						location.reload(true);
					// }
				}, 'text');
			}
			function displayCustomerSupportDataInForm( customerSupportID, form ) {
				var customerSupport = listOfCustomerSupports[ customerSupportID ];
				console.log( customerSupport );
				form.find( 'input,select,textarea' ).each(function(){
					var input = $(this),
						name = input.attr( 'name' );
						if ( name == 'action' ) return;// exclude input hidden named 'action'
						
					input.val( customerSupport[ name ] );
					if ( name == 'price' ) {
						input.val(Number(input.val()).toFixed(2));
					}
				});
			}
			$(document).ready(function(){ //----------------------------------------------------------------------------------------
				// For modal functionality
					$( '.btn-open-ticket' ).click(function(e){
							$( '#open-ticket' ).modal( 'show' );
						e.preventDefault();
					});
					
					$( '.btn-view' ).click(function(e){
							var customerSupportID = $(this).data( 'id' ),
								form = $( '#view-customer-support form' );
							displayCustomerSupportDataInForm( customerSupportID, form );
							$( '#view-customer-support' ).modal( 'show' );
						e.preventDefault();
					});

				// For AJAX functionality
					$( '#open-ticket' ).find( 'form' ).submit(function(e){
						send_form_via_ajax( this );
						e.preventDefault();
					});
					$( '.btn-delete' ).click(function(e){
						if( !confirm('Do you really want to delete this medicine?') ) return;
						var medicineID = $(this).data( 'id' );
						send_data_via_ajax({ id:medicineID,action: 'delete' });
						e.preventDefault();
					});
			});//-------------------------------------------------------------------------------------------------------------------
	</script>
	{/literal}
{/block}