<?php

/**
 * Function to query information based on 
 * a parameter: in this case, location.
 *
 */

if (isset($_POST['submit'])) 
{
	$student1 = $_POST['student1'];
	$student2 = $_POST['student2'];
	try 
	{	
		require "../config.php";
		require "../common.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql1 = "SELECT id FROM student WHERE email = :student1 ";
		$statement = $connection->prepare($sql1);
		$statement->bindParam(':student1', $student1, PDO::PARAM_STR);
		$statement->execute();
		$result = $statement->fetch();
		$student_id1 = $result['id'];
	}
	
	catch(PDOException $error) 
	{
		echo $sql1 . "<br>" . $error->getMessage();
	}
	try 
	{
		$sql2 = "SELECT id FROM student WHERE email = :student2 ";
		$statement = $connection->prepare($sql2);
		$statement->bindParam(':student2', $student2, PDO::PARAM_STR);
		$statement->execute();
		$result2 = $statement->fetch();
		$student_id2 = $result2['id'];
	}
	
	catch(PDOException $error) 
	{
		echo $sql2 . "<br>" . $error->getMessage();
	}
		try 
		{
		$sql3 ="SELECT club_id from `student_x_club` where student_id=:student_id1 and club_id IN ( SELECT club_id FROM `student_x_club` WHERE student_id= :student_id2)";
		
		$statement = $connection->prepare($sql3);
		$statement->bindParam(':student_id1', $student_id1, PDO::PARAM_STR);
		$statement->bindParam(':student_id2', $student_id2, PDO::PARAM_STR);
		$statement->execute();
		$result = $statement->fetchAll();
		$listOfClubs=array();
		array_push($listOfClubs,$result);
		$listOfClubs = $listOfClubs[0];

	}
	
	catch(PDOException $error) 
	{
		echo $sql3 . "<br>" . $error->getMessage();
	}
}
?>

<?php include "templates/header.php"; ?>
<!DOCTYPE HTML>
<html>
	<body>
			<section id="two" class="wrapper style2 special">
				<div class="inner narrow">
					<header>
						<h2>Student Relationship</h2>
					</header>
					<form class="grid-form" method="post" >
						<div class="form-control narrow">
							<label for="student1">Student 1</label>
							<input name="student1" id="student1" type="text">
                        </div>
                        <div class="form-control narrow">
							<label for="student2">Student 2</label>
							<input name="student2" id="student2" type="text">
						</div>
						<ul class="actions">
							<input value="Analyze" name="submit" type="submit">
						</ul>
					</form>
				
	


		
<?php 
if (isset($_POST['submit'])) 
{
	if (count($listOfClubs) >0) 
	{ ?>
		<h2>Results</h2>
		<?php echo 'True'; 
	}
	else 
	{?>
		<h2>Results</h2>
		<?php echo 'False'; 
	}
}

?> 
</div>
			</section>
<p>
<a href="home.php">Back to home</a>
</p>
<?php include "templates/footer.php"; ?>
