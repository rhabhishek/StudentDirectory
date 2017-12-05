<?php

/**
 * Function to query information based on 
 * a parameter: in this case, location.
 *
 */

if (isset($_POST['submit'])) 
{
	
	try 
	{	
		require "../config.php";
		require "../common.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT * 
						FROM student
						WHERE email = :email";

		$location = $_POST['email'];

		$statement = $connection->prepare($sql);
		$statement->bindParam(':email', $location, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetchAll();
	}
	
	catch(PDOException $error) 
	{
		echo $sql . "<br>" . $error->getMessage();
	}
}
?>
<?php require "templates/header.php"; ?>
<!DOCTYPE HTML>
<html>
	<body>
			<section id="two" class="wrapper style2 special">
				<div class="inner narrow">
					<header>
						<h2>Search Student</h2>
					</header>
<form class="grid-form" method="post">
<div class="form-control">
	<label for="email">Student Email</label>
    <input type="text" id="email" name="email">
    </div>
    <ul class="actions">
    <input type="submit" name="submit" value="Search">
						</ul>

</form>

<a href="index.php">Back to home</a>
		
<?php  
if (isset($_POST['submit'])) 
{
	if ($result && $statement->rowCount() > 0) 
	{ ?>
		<h2>Results</h2>

		<table>
			<thead>
				<tr>
					<th>Student #</th>
					<th>Name</th>
					<th>Email Address</th>
				</tr>
			</thead>
			<tbody>
	<?php 
		foreach ($result as $row) 
		{ ?>
			<tr>
				<td><?php echo escape($row["id"]); ?></td>
				<td><?php echo escape($row["name"]); ?></td>
				<td><?php echo escape($row["email"]); ?></td>
			</tr>
		<?php 
		} ?>
		</tbody>
	</table>
	<?php 
	} 
	else 
	{ ?>
		<blockquote>No results found for <?php echo escape($_POST['location']); ?>.</blockquote>
	<?php
	} 
}?> 
<a href="index.php">Back to home</a>

<?php require "templates/footer.php"; ?>