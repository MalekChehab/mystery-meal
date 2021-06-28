<?php
    class Constants{
        //DATABASE DETAILS
        static $DB_SERVER="143.244.152.251";
        static $DB_NAME="mysterymealdb";
        static $USERNAME="mysterymeal_user_2";
        static $PASSWORD="mysterymeal_62021";
        
    }

    class Orders{
    
        public function connect(){
            $con=new mysqli(Constants::$DB_SERVER,Constants::$USERNAME,Constants::$PASSWORD,Constants::$DB_NAME);
            if($con->connect_error){
                // echo "Unable To Connect"; - For debug
                return null;
            }else{
                //echo "Connected"; - For debug
                return $con;
            }
        }
    
        public function select(){
            $conn = $this->connect();
            $username=$_POST['username'];
            $query="SELECT id FROM users WHERE username = '$username' AND profile_type='Customer' ";
            $result = mysqli_query($conn,$query);
            $row=mysqli_fetch_array($result);
            $customer_id=$row['id'];
            
            
            
         
            if($conn != null){
                $result=$conn->query("SELECT * FROM orders WHERE customer_id ='$customer_id' ");
                if($result->num_rows>0){
                    $orders=array();
                    while($row=$result->fetch_array()){
                            $store_id=$row['store_id'];
                            $sql="SELECT s_name from stores where id = '$store_id'";
                            $result2 = mysqli_query($conn,$sql);
                            $row2=mysqli_fetch_array($result2);
                            $s_name=$row2['s_name'];
                            
                             $created_at=$row['created_at'];
                            
                        array_push($orders, array("id"=>$row['id'],
                        "total_order_price"=>$row['total_order_price'],"store_id"=>$row['store_id'],
                        "box_id"=>$row['box_id'],"status"=>$row['status'],"s_name"=>$s_name,"created_at"=>$created_at));
                    }
                    print(json_encode(array_reverse($orders)));
                }else{
                    print(json_encode(array("PHP EXCEPTION : CAN'T RETRIEVE FROM MYSQL. ")));
                }
                $conn->close();

            }else{
                print(json_encode(array("PHP EXCEPTION : CAN'T CONNECT TO MYSQL. NULL CONNECTION.")));
            }
        }
    }
    $orders=new Orders();
    $orders->select();

    //end
?>