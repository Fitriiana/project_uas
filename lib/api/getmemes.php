<?php
  header("Access-Control-Allow-Origin: *"); 
  $conn = new mysqli("localhost", "flutter_160419063","ubaya","flutter_160419063");
    
  $arr=null;

  if($conn->connect_error) {
    $arr= ["result"=>"error","message"=>"unable to connect"];
  } else {
    $iduser = $_POST['iduser'];
    $sql = "SELECT * from memes where iduser != ? order by tanggal_pembuatan desc";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i",$iduser);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = [];
    if ($result) {
        while($r = $result->fetch_assoc())
        {
            array_push($data,$r);
        }
        $arr = ["result"=>"success","data"=>$data];
    } else {
        $arr = ["result"=>"error","message"=>"sql error: $sql"];
    }  
  }
  echo json_encode($arr);
  $stmt->close();
  $conn->close();
