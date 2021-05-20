<?php


try{

$connection = new PDO('mysql:host=localhost;dbname=id16644001_mysterymeal_db','id16644001_mysterymealdb','gmd$0RC09+{NCa%U');
$connection ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
echo"Connected Successfully";
}catch(PDOException $exc){
echo $exc->getMessage();
die("couldn't connect");

}



?>