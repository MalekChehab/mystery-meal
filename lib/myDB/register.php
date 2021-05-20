<?php

//Define your Server host name here.
$HostName = "localhost";

//Define your MySQL Database Name here.
$DatabaseName = "id16644001_mysterymeal_db";

//Define your Database User Name here.
$HostUser = "id16644001_mysterymealdb";

//Define your Database Password here.
$HostPass = "gmd$0RC09+{NCa%U";

// Creating MySQL Connection.
$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);

// Storing the received JSON into $json variable.
$json = file_get_contents('php://input');

// Decode the received JSON and Store into $obj variable.
$obj = json_decode($json,true);

// Getting firstname from $obj object.
$firstname = $obj['firstname'];

//Getting lastname from $obj object.
$lastname = $obj['lastname'];

$username = $obj['username'];

// Getting Email from $obj object.
$email = $obj['email'];

// Getting Password from $obj object.
$password = $obj['password'];

// Checking whether Email is Already Exist or Not in MySQL Table.
$CheckSQL = "SELECT * FROM users WHERE email='$email'";

// Executing Email Check MySQL Query.
$check = mysqli_fetch_array(mysqli_query($con,$CheckSQL));

if(isset($check)){

	 $emailExist = 'Email Already Exist, Please Try Again With New Email Address..!';

	 // Converting the message into JSON format.
// 	$existEmailJSON = json_encode($emailExist);
echo "already existing email";
	// Echo the message on Screen.
	 echo $existEmailJSON ;

  }
 else{

	 // Creating SQL query and insert the record into MySQL database table.
	 $Sql_Query = "insert into users (firstname,lastname,email,password) values ('$firstname','$lastname','$email','$password')";


	 if(mysqli_query($con,$Sql_Query)){

		 // If the record inserted successfully then show the message.
		$MSG = 'User Registered Successfully' ;

		// Converting the message into JSON format.
		$json = json_encode($MSG);

		// Echo the message.
		 echo $json ;

	 }
	 else{

		echo 'Try Again';

	 }
 }
 mysqli_close($con);
?>