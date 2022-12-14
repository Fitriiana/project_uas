<?php
header("Access-Control-Allow-Origin: *");
$arr = null;

$conn = new mysqli("localhost", "flutter_160419063", "ubaya", "flutter_160419063");
extract($_POST);

if ($conn->connect_error) {
  $arr = ["result" => "error", "message" => "unable to connect"];
} else {
  $sql = "SELECT * FROM users where username=? and password=?";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("ss", $username, $password);
  $stmt->execute();
  $result = $stmt->get_result();
  if ($result->num_rows > 0) {
    $r = mysqli_fetch_assoc($result); 
    $arr = ["result" => "success", "data" => $r];
  } else {
    $arr = ["result" => "error", "message" => ""];
  }
}
echo json_encode($arr);
$conn->close();
