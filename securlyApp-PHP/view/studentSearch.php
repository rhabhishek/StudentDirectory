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

		$sql = "SELECT student.id 'student_id', student.name 'name', school.name 'school' FROM `student`, `school` WHERE school_id = school.id and email = :email ";

		$email = $_POST['email'];

		$statement = $connection->prepare($sql);
		$statement->bindParam(':email', $email, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetch();
		$schoolName = $result['school'];
		$student_id = $result['student_id'];
		$studentName = $result['name'];

		$sql2 ="SELECT (select name from `club` where id=a.id) as 'name' FROM `student_x_club` as `a` WHERE a.student_id = :student_id";
		
		$statement = $connection->prepare($sql2);
		$statement->bindParam(':student_id', $student_id, PDO::PARAM_STR);
		$statement->execute();
		$result = $statement->fetchAll();
		$listOfClubs=array();
		array_push($listOfClubs,$result);
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


		
<?php 
if (isset($_POST['submit'])) 
{
	if ($studentName) 
	{ ?>
		<h2>Results</h2>
		<?php 
		echo $studentName. "<br>";
		echo $schoolName;
		if(count($listOfClubs[0]) > 0){
			echo ", Involved in "; 
			foreach($listOfClubs[0] as $id=>$club){
				echo $club[0].", ";
			}
		}
	} 
	else 
	{ ?>
		<blockquote>No results found for <?php echo escape($_POST['email']); ?>.</blockquote>
	<?php
	} 
}

?> 
</div>
			</section>
<p>
<a href="home.php">Back to home</a>
</p>
<?php require "templates/footer.php"; ?>
</body>
</html>