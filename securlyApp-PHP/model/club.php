<?php 

class Club{
    private $id;
    private $name;
    private $schoolId;
    private $listOfStudents[];

    public function getId(){
        return $id;
    } 

    public function getName(){
        return $name;
    }

    public function getSchoolId(){
        return $schoolId;
    }

    public function setId(id){
        $id = id;
    }

    public function setName(name){
        $name = name;
    }

    public function setSchoolId(schoolId){
        $schoolId = schoolId;
    }

    public function getstudentList(){
        return $listOfStudents;
    }

    public function setStudentList(studentlist){
        $listOfStudents = studentList;
    }
}
?>