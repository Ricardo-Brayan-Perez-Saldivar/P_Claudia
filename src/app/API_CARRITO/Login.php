<?php
    //Permiten realizar una comprobacion a la conexion de la vase de datos
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    
    //Variables
    $json = file_get_contents('php://input'); //Resibe el JSON de Angular
    $params = json_decode($json); //Decodificar en JSON y lo guarda en esta variable

    require("conexionC.php"); //Importa el archivo con la conexion

    $conexion = conexion();  //Crear la conexion

    //Operacion de login
    
    $resultado = "CALL LOGIN('$params->EMAIL','$params->CONTRASENA')";
    //$resultado = "SELECT * FROM USUARIO WHERE EMAIL='$params->EMAIL' AND CONTRASENA = '$params->CONTRASENA'";

    //Se realizara la QUERY a la base de datos
    $resul = mysqli_query($conexion,$resultado);

    class Result{}

    //Se generan los datos de respuesta
    $response = new Result();
    if($resul->num_rows > 0){
        $response->resultado = 'OK';
        $response->mensaje = 'LOGIN EXITOSO';
    }else{
        $response->resultado = 'FAIL';
        $response->mensaje = 'LOGIN FALLIDO :(';
        //$response->resu= $resul;
    }
    header('Content-Type: application/json');

    echo json_encode($response);  //Muestra el JSON que se genero


?>