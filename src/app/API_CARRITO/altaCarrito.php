<?php
    //Permiten realizar una comprobacion a la conexion de la vase de datos
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    
    //Variables
    $json = file_get_contents('php://input'); //Resibe el JSON de Angular
    $params = json_decode($json); //Decodificar en JSON y lo guarda en esta variable

    require("conexionC.php"); //Importa el archivo con la conexion

    $conexion = conexion();  //Crear la conexion

    $cantidad = "1";
    //Operacion a realizar
    $pa_Carrito = "CALL ING_CARRITO($params->ID_U1,$params->ID_P1,$cantidad)";
    //Se realizara la QUERY a la base de datos
    mysqli_query($conexion,$pa_Carrito);

    class Result{}

    //Se generan los datos de respuesta
    $response = new Result();
    $response->resultado = 'OK';
    $response->mensaje = 'PRODUCTO GUARDADO EN CARRITO EXITOSAMENTE';

    header('Content-Type: application/json');

    echo json_encode($response);  //Muestra el JSON que se genero


?>