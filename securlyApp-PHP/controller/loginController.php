in login controller
<?php 

require "../config.php";
require "../common.php";

try 
{
    $connection = new PDO($dsn, $username, $password, $options);

    $sql = sprintf(
            "SELECT * FROM %s WHERE %s = '%s' AND %s = '%s'",
            "login", "username", $_POST['username'], "password" , $_POST['password']
    );
    
    $statement = $connection->prepare($sql);
    $result = $statement->execute();
    if($result){
        header('Location: ../view/home.php');
        exit();
    }
}
catch(PDOException $error) 
{
    echo $sql . "<br>" . $error->getMessage();
}


?>