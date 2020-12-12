<?php
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

    require("conexionC.php"); //Se importa el archivo de la conexion

    $conexion = conexion();  //Se crea la conexion

    //Se realiza la consulta
    $seleccionarP = "SELECT ID_P AS ID_P1 FROM PRODUCTO 
    WHERE ID_P=$_GET[ID_P]";

    //Se realiza la QUERY a la base de datos
    $registro = mysqli_query($conexion, $seleccionarP);

    //Se recorre el resultado y se guarda en un array
    if($resultado = mysqli_fetch_array($registro)){
        $datos[] = $resultado;
    }

    $json = json_encode($datos); //Se genera el JSON con los datos obtenidos

    echo $json;  //Se muestra el JSON generado

    header('Content-Type: application/json');

?>