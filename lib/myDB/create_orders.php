<?php
$servername = "143.244.152.251";
$username = "mysterymeal_user_2";
$password = "mysterymeal_62021";
$database = "mysterymealdb";
$conn = mysqli_connect($servername,$username,$password,$database);
$response;



$keys=array('box_id','customer_username','total_price','store_id');
//$keys=array('name','mobile','password','type');
for ($i = 0; $i < count($keys); $i++){
	if(!isset($_POST[$keys[$i]])){
		  $response['error'] = true;
			$response['message'] = 'Required Filed Missed';
			echo json_encode($response);
		  return;
	 }
}

$box_id=$_POST['box_id'];


$customer_username=$_POST['customer_username'];
$query = "SELECT id FROM users where username = '$customer_username' and profile_type='Customer'  ";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_array($result);
$customer_id = $row['id'];

$total_price=$_POST['total_price'];
$store_id=$_POST['store_id'];

                
						$stmt = $conn->prepare("INSERT INTO orders(customer_id, total_order_price,box_id,store_id) VALUES (?, ?, ?,?)");
						$stmt->bind_param("ssss",  $customer_id, $total_price, $box_id, $store_id);
                     
						//if the user is successfully added to the database
						if($stmt->execute()){
						 
						

							//adding the user data in response
							$response['error'] = false;
							$response['message'] = 'Order added successfully';
			                
                            echo json_encode($response);
						}


					
?>
