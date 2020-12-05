<?php
    //Permiten realizar una comprobacion a la conexion de la vase de datos
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    
    //Variables
    $json = file_get_contents('php://input'); //Resibe el JSON de Angular
    $params = json_decode($json); //Decodificar en JSON y lo guarda en esta variable

    require("conexionC.php"); //Importa el archivo con la conexion

    $conexion = conexion();  //Crear la conexion

    
    //Operacion de insercion de domicilio
    $pa_ING_DOMICILIO = "CALL ING_DOMICILIO ($params->ID_U2, '$params->CALLE', $params->N_EXT, $params->N_INT, 
    '$params->COLONIA', '$params->CIUDAD', $params->CP, '$params->PAIS') ";
    
    
    //Se realizara la QUERY a la base de datos
    mysqli_query($conexion,$pa_ING_DOMICILIO);
    
    class Result{}

    //Se generan los datos de respuesta
    $response = new Result();
    $response->resultado = 'OK';
    $response->mensaje = 'SE REGISTRO EL DOMICILIO EXITOSAMENTE';

    header('Content-Type: application/json');

    echo json_encode($response);  //Muestra el JSON que se genero


?>