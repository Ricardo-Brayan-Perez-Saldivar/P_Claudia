<?php 
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

    require("conexion.php");  //Se importa el archivo con la conexion

    $conexion = conexion();

    //Operacion eliminar
    $eliminarP = "DELETE FROM PRODUCTO WHERE ID_P = $_GET[ID_P]";

    //Se realiza la QUERY en la base de datos
    mysqli_query($conexion,$eliminarP);

    class Result{}

    //Se genera los datos de respuesta
    $responde = new Result();
    $responde ->resultado = "OK";
    $responde ->mensaje = 'EL PRODUCTO SE ELIMINO EXITOSAMENTE';

    header ('Content-Type: application/json');

    echo json_encode($responde); //Se muestra el JSON generado
?>