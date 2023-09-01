<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>INSPIRED - Forgot Password</title>
<link rel="shortcut icon" type="image/png"
	href="../assets/images/logos/logo.png" />
<link rel="stylesheet" href="../assets/css/styles.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">
</head>

<body class="img js-fullheight"
	style="background-image: url(Images/bg.jpg);">

	<%
	String msg = request.getParameter("msg");
	String errorMessage = request.getParameter("errorMessage");
	if ("done".equals(msg)) {
	%>
	<div class="alert alert-success" role="alert"> Password Change Successfully! </div>
	<%
	}
	%>
	<%
	if ("invalid".equals(msg)) {
	%>
	<div class="alert alert-danger" role="alert">Some thing Went Wrong! Try Again!</div>
	<%
	}
	%>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Setup Password</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
						<h3 class="mb-4 text-center">You want to reset your password</h3>
						<form action="forgotPasswordAction.jsp" method="post" class="signin-form">
							<div class="form-group">
								<input type="email" name="email" class="form-control"
									placeholder="Enter Email" required>
							</div>
							<div class="form-group">
								<input id="password-field" type="password" name="newPassword"
									class="form-control" placeholder="Enter your New Password" required> <span
									toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
							</div>
							<div class="form-group">
								<input type="submit" value="Submit"
									class="form-control btn btn-primary submit px-3">
							</div>
							<div class="form-group d-md-flex">
								<div class="w-50">
									<!-- <label class="checkbox-wrap checkbox-primary">Remember
										Me <input type="checkbox"> <span class="checkmark"></span>
									</label> -->
								</div>
								<div class="w-50 text-md-right">
									<a href="login.jsp" style="color: #fff">Back to Login</a>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</section>


	<script src="../assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../assets/js/sidebarmenu.js"></script>
	<script src="../assets/js/app.min.js"></script>
	<script src="../assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script src="../assets/libs/simplebar/dist/simplebar.js"></script>
	<script src="../assets/js/dashboard.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>