<?php
    //Permiten realizar una comprobacion a la conexion de la vase de datos
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    
    //Variables
    $json = file_get_contents('php://input'); //Resibe el JSON de Angular
    $params = json_decode('$json'); //Decodificar en JSON y lo guarda en esta variable

    require("conexion.php"); //Importa el archivo con la conexion

    $conexion = conexion();  //Crear la conexion

    //Operacion de insercion de producto
    $insertarU = "INSERT INTO USUARIO VALUES
    ('$params -> ID_U','$params -> NOM_U', '$params -> AP_P','$params -> AP_M',
    '$params -> EDAD','$params -> SEXO','$params -> FOTO',' $params -> SOBRENOMBRE', 
    '$params -> EMAIL','$params -> CONTRASEÑA','$params -> ID_CALLE1',
    '$params -> ID_COL1','$params -> ID_DM1','$params -> ID_PA1')";

    //Se realizara la QUERY a la base de datos
    mysqli_query($conexion,$insertarU);

    class Result{}

    //Se generan los datos de respuesta
    $responde = new Result();
    $responde->resultado = 'OK';
    $responde->mensaje = 'Se registro exitosamente el producto';

    header('Content-Type: application/json');

    echo json_encode($responde);  //Muestra el JSON que se genero


?>