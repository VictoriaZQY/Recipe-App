<?php

include 'connection.php';
class emp
{
}
$storage_id = isset($_POST['storage_id']) ? $_POST['storage_id'] : null;  
$name = isset($_POST['name']) ? $_POST['name'] : null;  
$quantity = isset($_POST['quantity']) ? $_POST['quantity'] : null;  
$unit = isset($_POST['unit']) ? $_POST['unit'] : null;  
$category = isset($_POST['category']) ? $_POST['category'] : null;  
$expirationDate = isset($_POST['expirationDate']) ? $_POST['expirationDate'] : null;  
$note = isset($_POST['note']) ? $_POST['note'] : null;    

$query = "UPDATE `storage`   
          SET `name` = '$name',   
              `quantity` = '$quantity',   
              `unit` = '$unit',   
              `category` = '$category',   
              `expirationDate` = '$expirationDate',   
              `note` = '$note'   
          WHERE `storage`.`storage_id` = '$storage_id'"; 

$result = mysqli_query($koneksi, $query);

if ($result) {

    $response = new emp();
    $response->success = 1;
    $response->message = "Successfully updating";
    die(json_encode($response));
} else {
    $response = new emp();
    $response->success = 0;
    $response->message = "Error while updating";
    die(json_encode($response));
}
