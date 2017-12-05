<?php
class School{
    private $id;
    private $name;
    private $listOfClubs[];
    private $listOfStudents[];

    public function getId(){
        return $id;
    } 

    public function getName(){
        return $name;
    }

    public function setId(id){
        $id = id;
    }

    public function setName(name){
        $name = name;
    }

    public function getClubList(){
        return $listOfClubs;
    }

    public function setClubList(clublist){
        $listOfClubs = clubList;
    }

    public function getstudentList(){
        return $listOfStudents;
    }

    public function setStudentList(studentlist){
        $listOfStudents = studentList;
    }
}

?>