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
		
		<h2>List of Messages: For Customer Support ID #{$customerSupportID}</h2>
		<br>
		
		{$flash}
		<table class="table table-bordered table-striped datatable">
				<thead>
					<tr>
						<th>No.</th>
						<th>Username</th>
						<th>Message</th>
						<th>Time</th>
					</tr>
				</thead>
				
				<tbody>
					{foreach $messages as $id => $row }
						{$role = ['User', 'Admin']}
						<tr>
							<td>{$row@iteration}</td>
							<td>{$row->user.username} <div class="badge badge-primary">{$role[$row->user.role]}</div></td>
							<td>{$row.message}</td>
							<td>{$row.created}</td>
						</tr>
					{/foreach}
				</tbody>
		</table>
		<br />
		<a href="customer_support.php" class="btn btn-primary">
			<i class="entypo-back"></i> Back
		</a>
		<a class="btn btn-success btn-new-message">
			<i class="entypo-plus"></i> New Message
		</a>
		
		<br />
		<br />
		<!-- Footer -->
		{include file='Elements/member_bottombar.tpl'}
	</div>
	{* Modal for CRUD functionality *}
	<!-- New Message Form-->
		<div class="modal fade" id="new-message">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Customer Support - New Message</h4>
					</div>
					<form method="POST">
						<input type="hidden" name="action" value="new-message">
						<input type="hidden" name="customer_support_id" value="{$customerSupportID}">
						<div class="modal-body">
							<div class="form-horizontal">
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
	<script>listOfMessages = {json_encode($messages)};</script>
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
					$( '.btn-new-message' ).click(function(e){
							$( '#new-message' ).modal( 'show' );
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
					$( '#new-message' ).find( 'form' ).submit(function(e){
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