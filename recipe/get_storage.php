<?php

include 'connection.php';

class user
{
}

$recipe_id = $_GET['recipe_id'];

$query = "SELECT r.*, u.username, u.photo_profile, u.email
            FROM recipe r, users u where r.user_id = u.user_id and recipe_id ='$recipe_id'";

$result =  mysqli_query($koneksi, $query);
if ($result) {
    $arraydata = array();
    while ($baris = mysqli_fetch_assoc($result)) {
        $arraydata[] = $baris;
    }
    echo json_encode($arraydata);
} else {
}


<?php  
include_once("connection.php");  
error_reporting(0);  

// 获取传入的数据  
  

// 初始化查询  
$query = "";  

// API: 如果类别为空，则获取所有数据  
if (!empty($user_id) && empty($category)) {  
    $query = "SELECT s.item_id, s.user_id, s.item_name, s.quantity, s.category, u.username, u.photo_profile   
              FROM storage s   
              JOIN users u ON s.user_id = u.user_id   
              WHERE s.user_id = '$user_id'   
              ORDER BY s.item_id";  
}  

// API: 如果类别不为空，则获取特定类别的数据  
if (!empty($category)) {  
    $query = "SELECT s.item_id, s.user_id, s.item_name, s.quantity, s.category, u.username, u.photo_profile   
              FROM storage s   
              JOIN users u ON s.user_id = u.user_id   
              WHERE s.category = '$category'   
              AND u.user_id = '$user_id'   
              ORDER BY s.item_id";  
}  

// 执行查询并获取结果  
$result = mysqli_query($koneksi, $query);  
$arraydata = array();  

while ($baris = mysqli_fetch_assoc($result)) {  
    $arraydata[] = $baris;  
}  

// 返回JSON格式的数据  
echo json_encode($arraydata);  
?>


