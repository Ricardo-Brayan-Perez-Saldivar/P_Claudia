<?php
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

    require("conexion.php"); //Se importa el archivo de la conexion

    $conexion = conexion();  //Se crea la conexion

    //Se realiza la consulta
    $seleccionarU = "SELECT * FROM USUARIO WHERE ID_U = $_GET[ID_U]";

    //Se realiza la QUERY a la base de datos
    $registro = mysqli_query($conexion, $seleccionarU);

    //Se recorre el resultado y se guarda en un array
    while ($resultado = mysqli_fetch_array($registro)){
        $datos[] = $resultado;
    }

    $json = json_encode($datos); //Se genera el JSON con los datos obtenidos

    echo $json;  //Se muestra el JSON generado

    header('Content-Type: application/json');

?>