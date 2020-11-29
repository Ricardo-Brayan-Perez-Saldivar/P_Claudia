<?php

    //Permiten realizar una comprobacion a la conexion de la vase de datos
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
    header("Allow: GET, POST, OPTIONS, PUT, DELETE");
    $method = $_SERVER['REQUEST_METHOD'];
    if($method == "OPTIONS") {
        die();
    }
    
    require("conexion.php"); //Importamos el archivo de la conexión

    $conexion = conexion(); //Se crea la conexion

    //Consulta a la base de datos
    $db_usuarios = "SELECT * FROM USUARIO";

    //Realiza la query a la DB
    $registros = mysqli_query($conexion,$db_usuarios);

    //Se recorre el resultado y se guarda en un array
    while($resultado = mysqli_fetch_array(registros)){
        $datos[] = $resultado;
    }

    $json = json_decode($datos); //Genera el archivo JSON con los datos obtenidos

    echo $json; //Muestra el JSON generado

    header('Content-Type: aplication/json');
    
?>