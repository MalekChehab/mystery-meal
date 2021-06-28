<?php

$servername = "143.244.152.251";
$username = "mysterymeal_user_2";
$password = "mysterymeal_62021";
$database = "mysterymealdb";

// Create connection
$conn = new mysqli($servername, $username, $password,$database);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>