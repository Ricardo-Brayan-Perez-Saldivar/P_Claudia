<?php

    //Permiten realizar una comprobacion a la conexion de la vase de datos
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

    require("conexion.php"); //Importamos el archivo de la conexión

    $conexion = conexion(); //Se crea la conexion

    //Consulta a la base de datos
    /*$db_usuarios = "SELECT ID_U, NOM_U, AP_P, AP_M, 
    EDAD, SEXO, FOTO, SOBRENOMBRE, EMAIL,CONTRASENA,
     ID_CALLE1, ID_COL1, ID_DM1, ID_PA1 
     FROM USUARIO";*/
     $db_Usuarios= "SELECT * FROM USUARIO";

    //Realiza la query a la DB
    $registros = mysqli_query($conexion,$db_Usuarios);

    //$datos=[];
    //Se recorre el resultado y se guarda en un array
    while($resultado = mysqli_fetch_array($registros)){
        $datos[] = $resultado;
    }

    $json = json_encode($datos); //Genera el archivo JSON con los datos obtenidos

    echo $json; //Muestra el JSON generado

    header('Content-Type: application/json');
    
?>