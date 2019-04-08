<?php
  class Classes {
    private $conn;
    private $table = 'classes';

    public $class_id; //from: class -> class_id
    public $class_date; //from: class -> class_date
    public $class_time; //from: class -> class_time
    public $instructor_name; //from: instructors -> instructor_name
    public $course_name; //from: courses -> course_name
    public $course_length; //from: courses -> course_length

    //Constructor
    public function __construct($db) {
      $this->conn = $db;
    }

    //Get Info
    public function read() {
      $query = 'SELECT
        cl.class_id as class_id,
        cl.class_time as class_time,
        cl.class_date as class_date,
        co.course_name as course_name,
        co.course_length as course_length,
        i.name as instructor_name
        FROM
        ' . $this->table . ' cl
        LEFT JOIN
         courses co ON cl.course_id = co.course_id
        LEFT JOIN
          instructors i ON cl.instructor_id = i.instructor_id
        ORDER BY
          cl.class_date ASC, cl.class_time ASC';

      //Prepare statement
      $statement = $this->conn->prepare($query);

      //execute query
      $statement->execute();

      return $statement;
    }

    public function readDay( ) {
      $query = "SELECT
        cl.class_id as class_id,
        cl.class_time as class_time,
        cl.class_date as class_date,
        co.course_name as course_name,
        co.course_length as course_length,
        i.name as instructor_name
        FROM
        " . $this->table . " cl
        LEFT JOIN
         courses co ON cl.course_id = co.course_id
        LEFT JOIN
          instructors i ON cl.instructor_id = i.instructor_id
        WHERE
          cl.class_date = :date
        ORDER BY
          cl.class_time ASC";
          //Prepare Statement
        $statement = $this->conn->prepare($query);
        $statement->bindParam(":date", $this->class_date);
        //execute query
        $statement->execute();

        $row = $statement->fetch(PDO::FETCH_ASSOC);

        return $statement;
    }

  }

 ?>
