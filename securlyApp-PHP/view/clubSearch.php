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

		$sql = "SELECT club.id clubId, school.name school FROM `club`, `school` WHERE club.school_id = school.id and club.name =  :clubname";

		$clubname = $_POST['clubname'];

		$statement = $connection->prepare($sql);
		$statement->bindParam(':clubname', $clubname, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetch();
		$schoolName = $result['school'];
		$clubId = $result['clubId'];

		$sql2 = "SELECT student.name FROM `student_x_club` x, `student` WHERE student.id = student_id and club_id =:clubId";
		$statement = $connection->prepare($sql2);
		$statement->bindParam(':clubId', $clubId, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetchAll();
		$listOfStudents=array();
		array_push($listOfStudents,$result);
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
						<h2>Search Club</h2>
					</header>
<form class="grid-form" method="post">
<div class="form-control">
	<label for="clubname">Club</label>
    <input type="text" id="clubname" name="clubname">
    </div>
    <ul class="actions">
    <input type="submit" name="submit" value="Search">
						</ul>

</form>
<?php  
if (isset($_POST['submit'])) 
{
	if ($clubId) 
	{ ?>
		<h2>Results</h2>
		<?php 
		echo $clubname. "<br>";
		echo $schoolName. "<br>";
		if(count($listOfStudents[0]) > 0){
			foreach($listOfStudents[0] as $id=>$name){
				echo $name[0].", ";
			}
		}
	} 
	else 
	{ ?>
		<blockquote>No results found for <?php echo escape($_POST['clubname']); ?>.</blockquote>
	<?php
	} 
}?> 
<p><a href="home.php">Back to home</a></p>
</div>
			</section>
<?php require "templates/footer.php"; ?>
</body>
</html>