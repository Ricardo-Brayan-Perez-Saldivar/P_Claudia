<?php 
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

    require("conexionC.php");  //Se importa el archivo con la conexion

    $conexion = conexion();

    //Operacion eliminar
    //$eliminarC= "DEL_CARRITO($_GET[ID_C])";
    $eliminarC = "DELETE FROM CARRITO WHERE ID_C=$_GET[ID_C]";

    //Se realiza la QUERY en la base de datos
    mysqli_query($conexion,$eliminarC);

    class Result{}

    //Se genera los datos de respuesta
    $response = new Result();
    $response->resultado = "OK";
    $response->mensaje = 'EL PRODUCTO SE ELIMINO DEL CARRITO';

    header ('Content-Type: application/json');

    echo json_encode($response); //Se muestra el JSON generado
?>