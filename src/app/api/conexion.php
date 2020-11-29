<?php
    //Conexion a la base de datos
    function conexion(){

        //variables principales de conexion
        $db_host = "192.168.0.8";
        $db_user = "root";
        $db_password = "123456789";
        $db_name = "proyectokn";

        //Elemento de conexion
        $conexion = mysqli_connect($db_host, $db_user, $db_password, $db_name);

        return $conexion;

    }
?>