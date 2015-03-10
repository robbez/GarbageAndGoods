<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GarbageAndGoods</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="css/mainStyle.css">
<link rel="stylesheet" href="css/signUp.css">
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" id="navbar">
	<div class="container navbar-left" id="navLinks">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				data-target="#navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

			<a href="index.jsp" class="navbar-brand">Garbage And Goods</a>
		</div>

		<div class="collapse navbar-collapse" id="navbar-collapse">

			<ul class="nav navbar-nav">
				<li><a href="index.jsp">HOME</a></li>
				<li><a href="#">NIGGA</a></li>
				<li><a href="#">ABDUL</a></li>
				<li><a href="#">MAX</a></li>
				<li><a href="#">PLINTUS</a></li>
			</ul>
		</div>
	</div>

	</nav>


	<div id="mainContent">

		<div class="SignUpImg">


			<form class="form-signup" id="signupForm" method="post" action="Registration.jsp">
				<h1 class="form-signin-heading">Sign Up Form</h1>

				<div class="form-group has-feedback">
					<label for="inputEmail">Email Address: </label> <input type="email"
						id="inputEmail" name = "inputEmail" class="form-control" placeholder="Email address"
						required="true" autofocus=""> <span
						class="glyphicon glyphicon-remove form-control-feedback"></span>
					<p class="help-block error-msg" style="display: none">sada</p>
				</div>
				<p class="help-block">Enter your email address</p>

				<div class="form-group has-feedback">
					<label for="inputName">Full Name: </label> <input type="text"
						id="inputName" name = "inputName" class="form-control" placeholder="Full Name"
						required="true" autofocus=""> <span
						class="glyphicon glyphicon-remove form-control-feedback"></span>
					<p class="help-block error-msg" style="display: none"></p>
				</div>
				<p class="help-block">Enter your full name</p>

				<div class="form-group has-feedback">
					<label for="dobInputs">Date of Birth: </label>
					<div class="form-inline" id="dobInputs">
						<div class="form-group ">
							<label class="sr-only" for="txt_month">Enter Month</label> <input
								type="text" id="txt_month" name="txt_month"
								class="form-control input-sm" style="width: 80px !important"
								placeholder="MM" required="true" maxlength="2"
								data-validation-required-message="Month is required"> <span
								class="glyphicon glyphicon-remove form-control-feedback"></span>
							<span class="slash">/</span>
						</div>
						<div class="form-group">
							<label class="sr-only" for="txt_day">Enter Day</label> <input
								type="text" id="txt_day" name="txt_day"
								class="form-control input-sm" style="width: 80px !important"
								placeholder="DD" required="true" maxlength="2"
								data-validation-required-message="Day is required"> <span
								class="glyphicon glyphicon-remove form-control-feedback"></span>
							<span class="slash">/</span>
						</div>
						<div class="form-group">
							<label class="sr-only" for="txt_year">Enter Year</label> <input
								type="text" id="txt_year" name="txt_year"
								class="form-control input-sm" style="width: 80px !important"
								placeholder="YYYY" required="true" maxlength="4"
								data-validation-required-message="Year is required"> <span
								class="glyphicon glyphicon-remove form-control-feedback"></span>
						</div>
					</div>
					<p class="help-block error-msg" style="display: none"></p>
				</div>
				<p class="help-block">Enter your date of birth</p>

				<div class="form-group has-feedback">
					<label for="userName">Username: </label> <input type="text"
						id="userName" name="userName" class="form-control" placeholder="Username"
						required="true" autofocus="" maxlength="15"> <span
						class="glyphicon glyphicon-remove form-control-feedback"></span>
					<p class="help-block error-msg" style="display: none"></p>
				</div>
				<p class="help-block">Enter your username</p>

				<div class="form-group has-feedback">
					<label for="password">Password: </label> <input type="password"
						id="password" name="password" class="form-control" placeholder="Password"
						required="true" autofocus=""> <span
						class="glyphicon glyphicon-remove form-control-feedback"></span>
					<p class="help-block error-msg" style="display: none"></p>
				</div>
				<p class="help-block">Enter password</p>

				<div class="form-group has-feedback">
					<label for="confirmpassword">Confirm Password: </label> <input type="password"
						id="confirmpassword" class="form-control" placeholder="Confirm password"
						required="true" autofocus=""> <span
						class="glyphicon glyphicon-remove form-control-feedback"></span>
					<p class="help-block error-msg" style="display: none"></p>
				</div>
				<p class="help-block">Confirm password</p>

				<button class="btn btn-lg btn-danger btn-block" type="submit"
					id="signupBtn">Sign Up</button>
			</form>

		</div>


	</div>


	<footer class="blog-footer">
	<p>Copyright @ Garbage&Goods 2015</p>
	<p>
		<a href="#">Back to top</a>
	</p>
	</footer>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/signUp.js"></script>
</body>
</html>