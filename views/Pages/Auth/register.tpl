<!DOCTYPE html>
<html lang="zxx">
<head>
	<base href="http://localhost/pharmacy/">
	{* <base href="https://xeno.com.my/onlineapp/pharmacy/"> *}

	<title>Online Pharmacy System</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">
	<!-- External CSS libraries -->
	<link type="text/css" rel="stylesheet" href="assets/auth/css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="assets/auth/fonts/font-awesome/css/font-awesome.min.css">
	<link type="text/css" rel="stylesheet" href="assets/auth/fonts/flaticon/font/flaticon.css">

	<!-- Favicon icon -->
	<link rel="shortcut icon" href="assets/auth/img/favicon.ico" type="image/x-icon" >

	<!-- Google fonts -->
	<link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

	<!-- Custom Stylesheet -->
	<link type="text/css" rel="stylesheet" href="assets/auth/css/style.css">

</head>
<body id="top">
<div class="page_loader"></div>

<!-- Login 22 start -->
<div class="login-22 tab-box">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 col-md-12 form-section">
				<div class="login-inner-form">
					<div class="details">
						<a href="auth/login.php" title="Online Pharmacy System">
							<img src="assets/pharmacy.png" alt="Online Pharmacy System" style="width: 80px; height:auto;">
						</a>
						{$flash}
						<h3>Create An Account</h3>
						<form method="POST">
							<div class="row">
								<div class="col-md-6 mb-4">
									<input type="text" name="username" class="form-control" placeholder="Username" aria-label="Username" required>
								</div>
								<div class="col-md-6 mb-4">
									<input type="email" name="email" class="form-control" placeholder="E-mail" aria-label="E-mail" required>
								</div>
							</div>
							<div class="form-group form-box">
								<input type="text" name="address" class="form-control" placeholder="Address" aria-label="Address" required>
							</div>
							<div class="row">
								<div class="col-md-6 mb-4">
									<input type="text" name="phone" class="form-control" placeholder="Phone" aria-label="Phone" required>
								</div>
								<div class="col-md-6 mb-4">
									<input type="text" name="matric_number" class="form-control" placeholder="Matric No." aria-label="Matric No." required>
								</div>
							</div>
							{* <div class="form-group form-box">
								<input type="text" name="matric_number" class="form-control col-md-6" placeholder="Matric No." aria-label="Matric No." required>
							</div> *}
							<div class="form-group form-box">
								<input type="password" name="password" class="form-control" autocomplete="off" placeholder="Password" aria-label="Password" required>
							</div>
							<div class="form-group form-box checkbox clearfix">
								<div class="form-check checkbox-theme">
									<input class="form-check-input" type="checkbox" value="" id="termsOfService">
									<label class="form-check-label" for="termsOfService">
										I agree to the<a href="#" class="terms">terms of service</a>
									</label>
								</div>
							</div>
							<div class="form-group">
								<button type="submit"
											class="btn btn-md btn-theme w-100 g-recaptcha"
											data-sitekey="{$google_recaptcha_site_key}" 
											data-callback='onSubmit'
											data-action='submit'>Register</button>
							</div>
							<p>Already a member?<a href="auth/login.php"> Login here</a></p>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-12 bg-img">
				<div class="informeson">
					<div class="btn-section">
						<a href="auth/login.php" class="link-btn">Login</a>
						<a href="auth/register.php" class="link-btn active">Register</a>
					</div>
					<h1>Welcome To <span>OPS</span></h1>
					<p>
						OPS is Online Pharmacy System.
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Login 22 end -->
	<style type="text/css">
		.grecaptcha-badge {
			z-index: 999;
		}
	</style>
<!-- External JS libraries -->
<script src="assets/auth/js/jquery-3.6.0.min.js"></script>
<script src="assets/auth/js/bootstrap.bundle.min.js"></script>
<script src="assets/auth/js/jquery.validate.min.js"></script>
<script src="assets/auth/js/app.js"></script>
<!-- Custom JS Script -->
<script src="https://www.google.com/recaptcha/api.js"></script>
<script type="text/javascript">
	function onSubmit(token) {
		var form = $( 'form' );
		if (form[0].reportValidity()) form.submit();
	}
</script>

</body>
</html>