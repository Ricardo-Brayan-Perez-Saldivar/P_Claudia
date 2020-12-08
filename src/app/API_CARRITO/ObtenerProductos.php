<?php
    //Permiten realizar una comprobacion a la conexion de la vase de datos
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    
    //Variables
    $json = file_get_contents('php://input'); //Resibe el JSON de Angular
    $params = json_decode($json); //Decodificar en JSON y lo guarda en esta variable

    require("conexionC.php"); //Importa el archivo con la conexion

    $conexion = conexion();  //Crear la conexion

    //Consulta a la base de datos
    /*$db_usuarios = "SELECT ID_U, NOM_U, AP_P, AP_M, 
    EDAD, SEXO, FOTO, SOBRENOMBRE, EMAIL,CONTRASENA,
     ID_CALLE1, ID_COL1, ID_DM1, ID_PA1 
     FROM USUARIO";*/
     $db_Usuarios= "SELECT NOM_P, PRECIO, CANTIDAD_E, FOTO_P FROM PRODUCTO WHERE PAIS ='E.E.U.U'";
     //$ver_Productos = "CALL VER_PRODUCTOS()";

    //Realiza la query a la DB
    //$registros = mysqli_query($conexion,$db_Usuarios);
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