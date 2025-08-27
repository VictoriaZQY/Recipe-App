<?php
include_once("connection.php");
error_reporting(0);
$category = $_GET['category'];
$user_id = $_GET['user_id'];  


// Api to get all storage
if (!empty($user_id) && empty($category)) {  
    $query = "SELECT s.storage_id, s.user_id, s.name, s.quantity, s.category, s.unit, s.expirationDate, s.note  
              FROM storage s, users u  
              WHERE s.user_id = u.user_id    
              AND u.user_id = '$user_id'   
              ORDER BY s.storage_id";   
} 

// Api to get storage by category
if (!empty($category)) {
    $query = "SELECT s.storage_id, s.user_id, s.name, s.quantity, s.category, s.unit, s.expirationDate, s.note
    FROM storage s, users u  
    WHERE s.user_id = u.user_id 
    AND s.category = '$category'   
    AND u.user_id = '$user_id'   
    ORDER BY s.storage_id";  
}


$result = mysqli_query($koneksi, $query);
$arraydata = array();

while ($baris = mysqli_fetch_assoc($result)) {
    $arraydata[] = $baris;
}
echo json_encode($arraydata);
