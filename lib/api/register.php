<?php
header("Access-Control-Allow-Origin: *");
$arr = null;

$conn = new mysqli("localhost", "flutter_160419069", "ubaya", "flutter_160419069");
extract($_POST);
$r_pass = $_POST['rPassword'];
$pass = $_POST['password'];
$tgl = date('Y/m/d');

if ($conn->connect_error) {
  $arr = ["result" => "error", "message" => "unable to connect"];
} else {
  if ($r_pass == $pass) {
    $sql = "INSERT INTO users(username, password, nama_depan, nama_belakang, privasi, link_avatar, tanggal_daftar) values(?,?,?,?,?,?,?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssiss", $username, $pass, $nama_depan, $nama_belakang, 0, "", $tgl);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
      $r = mysqli_fetch_assoc($result);
      $arr = ["result" => "success", "user_name" => $r['user_name']];
    } else {
      $arr = ["result" => "error", "message" => "sql error: $sql"];
    }
  }
}
echo json_encode($arr);
$conn->close();
