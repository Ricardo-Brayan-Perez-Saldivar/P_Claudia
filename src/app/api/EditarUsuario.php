<?php 
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    
    //Variables a ocupar
    $json = file_get_contents('php://input');
    $params = json_decode($json);

    require("conexion.php");  //Se importa el archivo con la conexion

    $conexion = conexion();  //Se crea la conexion

    //Operacion de Actualizar
    $EditarU = "UPDATE PRODUCTO
    SET NOM_U = '$params -> NOM_U', 
    AP_P = '$params -> AP_P',
    AP_M = '$params -> AP_M',
    EDAD = '$params -> EDAD',
    SEXO = '$params -> SEXO',
    FOTO = '$params -> FOTO',
    SOBRENOMBRE = '$params -> SOBRENOMBRE', 
    EMAIL = '$params -> EMAIL',
    CONTRASEÑA = '$params -> CONTRASEÑA',
    ID_CALLE1 = '$params -> ID_CALLE1',
    ID_COL1 = '$params -> ID_COL1',
    ID_DM1 = '$params -> ID_DM1',
    ID_PA1 = '$params -> ID_PA1'
    WHERE ID_U = $params->ID_U";

    //Se realiza la QUERY a la base de datos
    mysqli_query($conexion, $EditarU);

    class Result {}

    //Genera los datos de respuesta
    $responde = new Result();
    $responde ->resultado = 'OK';
    $responde -> mensaje = 'EL PRODUCTO SE ACTUALIZO EXITOSAMENTE';

    header('Content-Type: application/json');

    echo json_encode($responde);  //Se muestra el JSON generado
?>