<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: GET, POST,');
header("Access-Control-Allow-Headers: X-Requested-With");
$arr = null;

$conn = new mysqli("localhost", "flutter_160419063", "ubaya", "flutter_160419063");

extract($_POST);
$r_pass = $_POST['rPassword'];
$pass = $_POST['password'];
$tgl =  date_create('now')->format('Y-m-d');

if ($conn->connect_error) {
  $arr = ["result" => "error", "message" => "unable to connect"];
} else {
  if ($r_pass == $pass) {
    $sql = "INSERT INTO users (username, nama_depan, nama_belakang, password, tanggal_daftar, link_avatar, privasi) VALUES (?,?,?,?,?,?,?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssi", $username, $nama_depan, $nama_belakang, $pass, $tgl, "", 0);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($stmt->affected_rows > 0) {
      $arr = ["result" => "success", "id" => $conn->insert_id];
    } else {
      $arr = ["result" => "fail", "Error" => $conn->error];
    }
  }
}
echo json_encode($arr);
$conn->close();
