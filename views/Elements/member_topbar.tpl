		<div class="row">
		
			<!-- Profile Info and Notifications -->
			<div class="col-md-6 col-sm-8 clearfix">
		
				<ul class="user-info pull-left pull-none-xsm">
		
					<!-- Profile Info -->
					<li class="profile-info dropdown"><!-- add class "pull-right" if you want to place this from right -->
		
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							{* <img src="../../assets/member/images/thumb-1@2x.png" alt="" class="img-circle" width="44" /> *}
							<img src="../../assets/pictures/{$user.picture}" alt="" class="img-circle" width="44" />
							{$user.username}
						</a>
							<ul class="dropdown-menu">
			
								<!-- Reverse Caret -->
								<li class="caret"></li>
			
								<!-- Profile sub-links -->
								<li>
									<a href="edit_profile.php">
										<i class="entypo-user"></i>
										Edit Profile
									</a>
								</li>
			
								{* <li>
									<a href="#">
										<i class="entypo-mail"></i>
										Inbox
									</a>
								</li>
			
								<li>
									<a href="#">
										<i class="entypo-calendar"></i>
										Calendar
									</a>
								</li>
			
								<li>
									<a href="#">
										<i class="entypo-clipboard"></i>
										Tasks
									</a>
								</li> *}
							</ul>
					</li>
				</ul>
			</div>
		
		
			<!-- Raw Links -->
			<div class="col-md-6 col-sm-4 clearfix hidden-xs">
		
				<ul class="list-inline links-list pull-right">
		
					<!-- Language Selector -->
					<li class="dropdown language-selector">
						Language: &nbsp;
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-close-others="true">
							<img src="../../assets/member/images/flags/flag-uk.png" width="16" height="16" />
						</a>
						<ul class="dropdown-menu pull-right">
							<li>
								<a href="#">
									<img src="../../assets/member/images/flags/flag-my.png" width="16" height="16" />
									<span>Bahasa Melayu</span>
								</a>
							</li>
							<li class="active">
								<a href="#">
									<img src="../../assets/member/images/flags/flag-uk.png" width="16" height="16" />
									<span>English</span>
								</a>
							</li>
						</ul>
					</li>
		
					<li class="sep"></li>
		
					<li>
						<a href="../../auth/logout.php">
							Log Out <i class="entypo-logout right"></i>
						</a>
					</li>
				</ul>
		
			</div>
		</div>
		<hr />