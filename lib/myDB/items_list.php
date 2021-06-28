<?php
    class Constants{
        //DATABASE DETAILS
        static $DB_SERVER="143.244.152.251";
        static $DB_NAME="mysterymealdb";
        static $USERNAME="mysterymeal_user_2";
        static $PASSWORD="mysterymeal_62021";
        
       
    }

    class item{
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
            $picture="";
            $con=$this->connect();
            if($con != null){
                $result=$con->query("SELECT * FROM items WHERE store_id ='$store_id' ");
                if($result->num_rows>0){
                    $item=array();
                    while($row=$result->fetch_array()){
                        if($row['picture']==null){
                            $picture="https://dummyimage.com/600x400/000/00ffff&text=+no+image";
                        }else{
                            $picture="http://mysterymeal.xyz/storage/".$row['picture'];
                        }
                        array_push($item, array("id"=>$row['id'],"title"=>$row['title'],
                        "picture"=>$picture,
                        "category"=>$row['category'],"price"=>$row['price'],
                        "store_id"=>$row['store_id']));
                    }
                    print(json_encode(array_reverse($item)));
                }else{
                    print(json_encode(array("PHP EXCEPTION : CAN'T RETRIEVE FROM MYSQL. ")));
                }
                $con->close();

            }else{
                print(json_encode(array("PHP EXCEPTION : CAN'T CONNECT TO MYSQL. NULL CONNECTION.")));
            }
        }
    }
    $item=new Item();
    $item->select();

    //end
?>