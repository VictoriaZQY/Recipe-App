<?php  

include 'connection.php';   

class StorageResponse  
{  
}  

$user_id = $_POST['user_id'];  
$name = $_POST['name'];  
$quantity = $_POST['quantity'];  
$unit = $_POST['unit'];  
$category = $_POST['category'];  
$expirationDate = $_POST['expirationDate'];  
$note = $_POST['note'];  

// add new item  
$query = "INSERT INTO storage (user_id, name, quantity, unit, category, expirationDate, note)   
VALUES ('$user_id', '$name', '$quantity', '$unit', '$category', '$expirationDate', '$note')";  

$result = mysqli_query($koneksi, $query); // query searching  

if ($result) {  
    $response = new StorageResponse();  
    $response->success = 1;  
    $response->message = 'Successfully post message';  

    die(json_encode($response)); // response with the successful JSON responce 
} else {  
    $response = new StorageResponse();  
    $response->success = 0;  
    $response->message = 'Failed post message';  

    die(json_encode($response)); // response with the failed JSON responce   
}  
?>