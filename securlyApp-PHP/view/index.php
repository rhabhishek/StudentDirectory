<?php include "templates/header.php"; ?>
<!DOCTYPE HTML>
<html>
	<body>
			<section id="two" class="wrapper style2 special">
				<div class="inner narrow">
					<header>
						<h2>Login</h2>
					</header>
					<form class="grid-form" method="post" action="../controller/loginController.php">
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
			</section>
	</body>
</html>
<?php include "templates/footer.php"; ?>