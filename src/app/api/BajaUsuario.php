<?php 
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

    require("conexion.php");  //Se importa el archivo con la conexion

    $conexion = conexion();

    //Operacion eliminar
    $eliminarU= "DELETE FROM USUARIO WHERE ID_U=$_GET[ID_U]";

    //Se realiza la QUERY en la base de datos
    mysqli_query($conexion,$eliminarU);

    class Result{}

    //Se genera los datos de respuesta
    $response = new Result();
    $response->resultado = "OK";
    $response->mensaje = 'EL USUARIO SE ELIMINO EXITOSAMENTE';

    header ('Content-Type: application/json');

    echo json_encode($response); //Se muestra el JSON generado
?>