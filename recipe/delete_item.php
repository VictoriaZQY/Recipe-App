<?php
include 'connection.php';

class emp
{
}

$storage_id = $_POST['storage_id'];

$query = "DELETE FROM `storage` WHERE `storage_id`='$storage_id'";
$result = mysqli_query($koneksi, $query);

if ($result) {
    $response = new emp();
    $response->success = 1;
    $response->message = "Successfully deleted";
    die(json_encode($response));
} else {
    $response = new emp();
    $response->success = 0;
    $response->message = "Error while deleting";
    die(json_encode($response));
}
