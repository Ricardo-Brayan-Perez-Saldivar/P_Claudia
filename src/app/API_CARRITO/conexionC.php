<?php
    //Conexion  la base de datos
    function conexion(){
        //variables principales de conexion
        $db_host = "localhost";
        $db_user = "root";
        $db_password = "123456789";
        $db_name = "pkn_carrito";

        //elemento de conexion
        $conexion = mysqli_connect($db_host, $db_user,$db_password,$db_name);

        return $conexion;
    }

?>