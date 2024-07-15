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
				<strong>List of Registered Users</strong>
			</li>
		</ol>		
		
		<h2>Registered Users</h2>
		<br>
		
		{$flash}
		<table class="table table-bordered table-striped datatable">
				<thead>
					<tr>
						<th>No.</th>
						<th>Username</th>
						<th>E-mail</th>
						<th>Phone</th>
						<th>Created</th>
						<th>Action</th>
					</tr>
				</thead>
				
				<tbody>
					{foreach $users as $id => $row }
						<tr>
							<td>{$row@iteration}</td>
							<td>{$row.username}</td>
							<td>{$row.email}</td>
							<td>{$row.phone|default:'-'}</td>
							<td>{$row.created}</td>
							<td>
								<button class="btn btn-info btn-sm btn-icon icon-left btn-view" data-id="{$id}"><i class="entypo-info"></i>View</button>
							</td>
						</tr>
					{/foreach}
				</tbody>
		</table>
		<br />
		<a class="btn btn-primary btn-add">
			<i class="entypo-plus"></i> Add New User
		</a>
		
		<br />
		<!-- Footer -->
		{include file='Elements/member_bottombar.tpl'}
	</div>
	{* Modal for CRUD functionality *}
	<!-- Add Form-->
		<div class="modal fade" id="add-user">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Add New User</h4>
					</div>
					<form method="POST">
						<input type="hidden" name="action" value="add">
						<div class="modal-body">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-3 control-label">Username</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input name="username" type="text" class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">E-mail</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input name="email" type="email" class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Phone</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input name="phone" type="text" class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Matric Number</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input name="matric_number" type="text" class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Role</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<select name="role" class="form-control">
												<option value=""> - Please Choose - </option>
												<option value="0">FSS</option>
												<option value="1">Chef</option>
												<option value="2">Admin</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Password</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon"><i class="entypo-key"></i></span>
											<input name="password" type="password" class="form-control">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-info">Save changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	<!-- View Form-->
		<div class="modal fade" id="view-user">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">View User</h4>
					</div>
					<form method="POST">
						<input type="hidden" name="action" value="add">
						<div class="modal-body">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-3 control-label">Username</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input name="username" type="text" class="form-control" disabled>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">E-mail</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input name="email" type="email" class="form-control" disabled>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Phone</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input name="phone" type="text" class="form-control" disabled>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Matric Number</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input name="matric_number" type="text" class="form-control" disabled>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Role</label>
									<div class="col-sm-9">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<select name="role" class="form-control" disabled>
												<option value=""> - Please Choose - </option>
												<option value="0">FSS</option>
												<option value="1">Chef</option>
												<option value="2">Admin</option>
											</select>
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
					{ "bSortable": false },
					null,
					{ "width": "30%" },
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
	<script>listOfUsers = {json_encode($users)};</script>
	{literal}
	<script>
			function send_form_via_ajax( form ) {
				var data = $(form).serialize();
				send_data_via_ajax( data );
			}
			function send_data_via_ajax( data ) {
				// console.log( data );
				$.post( '', data,function( response ){
					console.log( response );
					// if ( response.result ) {
						location.reload(true);
					// }
				}, 'json');
			}
			function displayUserDataInForm( userID, form ) {
				var user = listOfUsers[ userID ];
				form.find( 'input,select' ).each(function(){
					var input = $(this),
						name = input.attr( 'name' );
						if ( name == 'action' ) return;// exclude input hidden named 'action'
					input.val( user[ name ] );
				});
			}
			$(document).ready(function(){ //----------------------------------------------------------------------------------------
				// For modal functionality
					$( '.btn-add' ).click(function(e){
							$( '#add-user' ).modal( 'show' );
						e.preventDefault();
					});
					
					$( '.btn-view' ).click(function(e){
							var userID = $(this).data( 'id' ),
								form = $( '#view-user form' );
							displayUserDataInForm( userID, form );
							$( '#view-user' ).modal( 'show' );
						e.preventDefault();
					});

				// For AJAX functionality
					$( '#add-user' ).find( 'form' ).submit(function(e){
						send_form_via_ajax( this );
						e.preventDefault();
					});
			});//-------------------------------------------------------------------------------------------------------------------
	</script>
	{/literal}
	<script>
			$(document).ready(function() {
				var password = $( '.password' ),
					confirm_password = $( '.confirm-password' ),
					input = $( 'input[type=password]' );

					password.on( 'invalid',function(e){
						if ( this.validity.tooShort ) {
							e.target.setCustomValidity( "Must contain minimum 8 characters." );
						} else if ( this.validity.patternMismatch ) {
							e.target.setCustomValidity( "Must contain at least 1 number, 1 uppercase letter, 1 lowercase letter and 1 special character." );
						}
					});

					$( '#edit-user .password' ).keyup(function(e) {
						var pwd = $(this),
							confirm = pwd.parents( '.modal-body' ).find( '.confirm-password' );
						if ( pwd.val() ) {
							confirm.prop( 'required', true );
						} else {
							confirm.prop( 'required', false );
						}
					});


					confirm_password.keyup(function(e){
						var input = $(this),
							value = input.parents( '.modal-body' ).find( '.password' ).val(),
							confirm_value = input.val();
							console.log( value+' : '+confirm_value );
						if ( value != confirm_value ) {
							e.target.setCustomValidity( "Password do not match" );
						} else {
							e.target.setCustomValidity( "" );
						}
					});

					input.on( 'input',function(e){
						e.target.setCustomValidity( "" );
					});
			});
	</script>
{/block}