student search controller
<?php 

require "../config.php";
require "../common.php";
require "../model/student.php";
try 
{
    $connection = new PDO($dsn, $username, $password, $options);

    $sql = sprintf(
            "SELECT * FROM %s WHERE %s = '%s'",
            "student", "email", $_POST['email']
    );
    
    $statement = $connection->prepare($sql);
    $statement->execute();
    $test;
    while ($row = $statement->fetch(PDO::FETCH_ASSOC))  {
        $student = new student();
        $student->setId($row['id']);
        $student->setName($row['name']);
        $student->setEmail($row['email']);
        $test = $student ;
    }
   $val = ($test->getId());

   echo("asdsad".$test->getName());
}
catch(PDOException $error) 
{
    echo $sql . "<br>" . $error->getMessage();
}


?>