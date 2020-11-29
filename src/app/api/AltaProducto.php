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
    $insertarP = "INSERT INTO PRODUCTO VALUES
    ('$params -> ID_P','$params -> NOM_P','$params -> PRECIO_P','$params -> CANT_P',
    '$params -> DESC_P','$params -> IMAGEN','$params -> ESTADO','$params -> ID_PAIS1',
    '$params -> ID_TIPO1')";

    //Se realizara la QUERY a la base de datos
    mysqli_query($conexion,$insertarP);

    class Result{}

    //Se generan los datos de respuesta
    $responde = new Result();
    $responde->resultado = 'OK';
    $responde->mensaje = 'Se registro exitosamente el producto';

    header('Content-Type: application/json');

    echo json_encode($responde);  //Muestra el JSON que se genero


?>