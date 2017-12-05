<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Typify by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<script  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	</head>
	<body>
			<section id="two" class="wrapper style2 special">
					
				<div class="inner narrow">
					<header>
						<h2>Login</h2>
					</header>
					<form class="grid-form" method="post" action="LoginController">
						<div class="form-control narrow">
							<label for="username">Username</label>
							<input name="username" id="username" type="text">
						</div>
						<div class="form-control narrow">
							<label for="password">Password</label>
							<input name="password" id="password" type="password">
						</div>
						<ul class="actions">
							<li><input value="Login" type="submit"></li>
						</ul>
					</form>
				</div>
				<blockquote>${msg}</blockquote>
			</section>
	</body>
</html>
<jsp:include page="templates/footer.jsp"></jsp:include>