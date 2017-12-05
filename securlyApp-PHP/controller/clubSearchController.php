in club search controller
<?php 

require "../config.php";
require "../common.php";

try 
{
    $connection = new PDO($dsn, $username, $password, $options);

    $sql = sprintf(
            "SELECT * FROM %s WHERE %s = '%s'",
            "clubs", "clubname", $_POST['club']
    );
    
    $statement = $connection->prepare($sql);
    $result = $statement->execute();
    if($result){
        echo $result;
    }
}
catch(PDOException $error) 
{
    echo $sql . "<br>" . $error->getMessage();
}


?>