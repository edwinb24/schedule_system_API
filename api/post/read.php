<?php
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Classes.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate classes object
  $myClass = new Classes($db);

  // class query
  $result = $myClass->read();
  // Get row count
  $num = $result->rowCount();

  // Check if any classes come back
  if($num > 0) {

    $class_arr = array();
    $class_arr['data'] = array();

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $class_item = array (
        'id' => $class_id,
        'date' => $class_date,
        'time' => $class_time,
        'instructor' => $instructor_name,
        'course' => $course_name,
        'length' => $course_length
      );

      //push to data
      array_push($class_arr['data'], $class_item);
    }
    echo json_encode($class_arr);
  } else {
    echo json_encode(
      array('message' => "No Classes Found")
    );
  }
 ?>
