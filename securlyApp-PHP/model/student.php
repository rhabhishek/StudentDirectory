<?php 

class student{

    var $id;
     var $name;
     var $email;

    public function getId(){
        echo $this->id."";
    } 

    public function getName(){
        echo $this->$name."";
    }

    public function setId($tempid){
        $id = $tempid;
    }

    public function setName($tempname){
        $name = $tempname;
    }

    public function getEmail(){
        return $this->$email;
    }

    public function setEmail($tempemail){
        $email = $tempemail;
    }
}
?>