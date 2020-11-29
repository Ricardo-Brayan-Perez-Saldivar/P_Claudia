<?php 
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    
    //Variables a ocupar
    $json = file_get_contents('php://input');
    $params = json_decode($json);

    require("conexion.php");  //Se importa el archivo con la conexion

    $conexion = conexion();  //Se crea la conexion

    //Operacion de Actualizar
    $EditarP = "UPDATE PRODUCTO
    SET NOM_P = '$params -> NOM_P',
    PRECIO_P = '$params -> PRECIO_P',
    CANT_P = '$params -> CANT_P',
    DESC_P = '$params -> DESC_P',
    IMAGEN = '$params -> IMAGEN',
    ESTADO = '$params -> ESTADO',
    ID_PAIS1 = '$params -> ID_PAIS1',
    ID_TIPO1 = '$params -> ID_TIPO1'
    WHERE ID_P = $params->ID_P";

    //Se realiza la QUERY a la base de datos
    mysqli_query($conexion, $EditarP);

    class Result {}

    //Genera los datos de respuesta
    $responde = new Result();
    $responde ->resultado = 'OK';
    $responde -> mensaje = 'EL PRODUCTO SE ACTUALIZO EXITOSAMENTE';

    header('Content-Type: application/json');

    echo json_encode($responde);  //Se muestra el JSON generado
?>