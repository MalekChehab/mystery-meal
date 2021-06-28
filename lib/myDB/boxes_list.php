<?php
    class Constants{
        //DATABASE DETAILS
        static $DB_SERVER="143.244.152.251";
        static $DB_NAME="mysterymealdb";
        static $USERNAME="mysterymeal_user_2";
        static $PASSWORD="mysterymeal_62021";
    }

    class Boxes{
        /*******************************************************************************************************************************************/
        /*
           1.CONNECT TO DATABASE.
           2. RETURN CONNECTION OBJECT
        */
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
        /*******************************************************************************************************************************************/
        /*
           1.SELECT FROM DATABASE.
        */
        public function select(){
            $store_id=$_POST['store_id'];
            $con=$this->connect();
            $query="SELECT s_name from stores where id = '$store_id' ";
            $result1=mysqli_query($con,$query);
            $row1=mysqli_fetch_array($result1);
            $s_name=$row1['s_name'];
            
            if($con != null){
                $result=$con->query("SELECT * FROM boxes WHERE store_id ='$store_id' ");
                if($result->num_rows>0){
                    $boxes=array();
                    while($row=$result->fetch_array()){
                        array_push($boxes, array("id"=>$row['id'],
                        "category"=>$row['category'],"nb_of_items"=>$row['nb_of_items'],
                        "total_price"=>$row['total_price'],"store_id"=>$row['store_id']
                        ,"s_name"=>$s_name));
                    }
                    print(json_encode(array_reverse($boxes)));
                }else{
                    print(json_encode(array("PHP EXCEPTION : CAN'T RETRIEVE FROM MYSQL. ")));
                }
                $con->close();

            }else{
                print(json_encode(array("PHP EXCEPTION : CAN'T CONNECT TO MYSQL. NULL CONNECTION.")));
            }
        }
    }
    $boxes=new Boxes();
    $boxes->select();

    //end
?>