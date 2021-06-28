<?php

$servername = "143.244.152.251";
$username = "mysterymeal_user_2";
$password = "mysterymeal_62021";
$database = "mysterymealdb";
$db = mysqli_connect($servername,$username,$password,$database);

    $username = $_POST['username'];
    $password = $_POST['password'];
    $profile_type = 'Customer';
    
    	$sql = "SELECT * FROM users WHERE username = '$username' AND profile_type = '$profile_type' ";
    
    	$result = mysqli_query($db,$sql);
    
    	$arr = mysqli_fetch_array($result);
            
                $hashedpassword = $arr['password'];
        
                if (password_verify($password, $hashedpassword) && mysqli_num_rows($result) ==1 ) {
                    echo json_encode("Success");
                } else {
                  echo json_encode("Error");
                }
           
   
      ?>  