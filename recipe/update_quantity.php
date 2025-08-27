<?php

include 'connection.php';
class emp
{
}

$name = isset($_POST['name']) ? $_POST['name'] : null;  
$quantity = isset($_POST['quantity']) ? $_POST['quantity'] : null;  
$unit = isset($_POST['unit']) ? $_POST['unit'] : null;  

$query = "UPDATE `storage`   
          SET `quantity` = '$quantity',   
              `unit` = '$unit',  
          WHERE `name` = '$name'  "; 

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



<?php

include 'connection.php';

class emp 
{
}

$name = isset($_POST['name']) ? $_POST['name'] : null;  
$quantity = isset($_POST['quantity']) ? $_POST['quantity'] : null;  
$unit = isset($_POST['unit']) ? $_POST['unit'] : null;  

if ($name === null || $quantity === null || $unit === null) {
    $response = new emp();
    $response->success = 0;
    $response->message = "Missing required fields.";
    die(json_encode($response));
}

// First, get the current quantity and unit from the storage table based on the name
$query = "SELECT `quantity`, `unit` FROM `storage` WHERE `name` = '$name'";
$result = mysqli_query($koneksi, $query);

if ($result && mysqli_num_rows($result) > 0) {
    // Ingredient found in storage
    $row = mysqli_fetch_assoc($result);
    $currentQuantity = $row['quantity'];
    $currentUnit = $row['unit'];

    // Convert the input unit to grams if necessary
    if ($unit == "kg" && $currentUnit == "g") {
        // Convert kg to g
        $quantityInGrams = $quantity * 1000;
    } elseif ($unit == "g" && $currentUnit == "kg") {
        // Convert g to kg (for consistency)
        $quantityInGrams = $quantity / 1000;
    } else {
        // No conversion needed if units are the same
        $quantityInGrams = $quantity;
    }

    // Subtract the quantity from the existing quantity
    $newQuantity = $currentQuantity - $quantityInGrams;

    // Check if the quantity is <= 0, in which case we delete the ingredient
    if ($newQuantity <= 0) {
        $deleteQuery = "DELETE FROM `storage` WHERE `name` = '$name'";
        $deleteResult = mysqli_query($koneksi, $deleteQuery);

        if ($deleteResult) {
            $response = new emp();
            $response->success = 1;
            $response->message = "Ingredient deleted from storage due to insufficient quantity.";
            die(json_encode($response));
        } else {
            $response = new emp();
            $response->success = 0;
            $response->message = "Error while deleting ingredient from storage.";
            die(json_encode($response));
        }
    } else {
        // Update the ingredient quantity in storage
        $updateQuery = "UPDATE `storage` SET `quantity` = '$newQuantity' WHERE `name` = '$name'";
        $updateResult = mysqli_query($koneksi, $updateQuery);

        if ($updateResult) {
            $response = new emp();
            $response->success = 1;
            $response->message = "Successfully updated ingredient quantity.";
            die(json_encode($response));
        } else {
            $response = new emp();
            $response->success = 0;
            $response->message = "Error while updating ingredient quantity.";
            die(json_encode($response));
        }
    }
} else {
    // Ingredient not found in storage
    $response = new emp();
    $response->success = 0;
    $response->message = "Ingredient not found in storage.";
    die(json_encode($response));
}
?>

