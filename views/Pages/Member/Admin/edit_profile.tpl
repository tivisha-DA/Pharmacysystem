{extends file="Layouts/member.tpl"}
{block name=body}
	<div class="main-content">
				
		{include file='Elements/member_topbar.tpl'}
		{$page = $page|capitalize|replace:'_':' '}
		
		<ol class="breadcrumb bc-3" >
			<li>
				<a href="#"><i class="fa-home"></i>Home</a>
			</li>
			<li>
				<a href="#">Pages</a>
			</li>
			<li class="active">
				<strong>Edit Profile</strong>
			</li>
		</ol>		
		
		<h2>Edit Profile</h2>
		<br>
		
		{$flash}
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<form method="POST" enctype="multipart/form-data">
					<div class="form-horizontal" style="border: 1px solid #eeeeee; padding: 15px 15px 0 15px; border-radius: 10px;">
						<div class="form-group">
							<label class="col-sm-3 control-label">Profile Picture</label>
							<div class="col-sm-9">
								{* <div class="input-group">
									<span class="input-group-addon">
										<i class="entypo-picture"></i>
									</span>
									<input class="form-control" type="file" name="picture">
								</div> *}
								<img class="img-thumbnail" src="../../assets/pictures/{$user.picture|default:'default.jpg'}" style="max-height: 150px;">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="entypo-picture"></i>
									</span>
									<input class="form-control" type="file" name="picture">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Fullname</label>
							<div class="col-sm-9">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="entypo-user"></i>
									</span>
									<input name="fullname" type="text" class="form-control" value="{$user.fullname}">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Phone</label>
							<div class="col-sm-9">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="entypo-phone"></i>
									</span>
									<input name="phone" type="text" class="form-control" value="{$user.phone}">
								</div>
							</div>
						</div>

						<!-- Login detail -->
							<div class="form-group" style="margin-top: 30px;">
								<label class="col-sm-3 control-label">Username</label>
								<div class="col-sm-9">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="entypo-user"></i>
										</span>
										<input name="username" type="text" class="form-control" value="{$user.username}">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">E-mail</label>
								<div class="col-sm-9">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="entypo-mail"></i>
										</span>
										<input name="email" type="email" class="form-control" value="{$user.email}">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Password</label>
								<div class="col-sm-9">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="entypo-key"></i>
										</span>
										<input name="password" type="password" class="form-control">
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-info pull-right">Save changes</button>
								</div>
							</div>
					</div>
				</form>
			</div>
		</div>
		
		

		
		<br />
		<!-- Footer -->
		{include file='Elements/member_bottombar.tpl'}
	</div>
{/block}