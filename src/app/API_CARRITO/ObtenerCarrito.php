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
    $db_Ver_Carrito= "CALL VER_CARRITO($_GET[ID_U1])";
    //$db_Ver_Carrito = "SELECT C.ID_C, P.FOTO_P, P.NOM_P, P.PRECIO, C.CANTIDAD FROM carrito C INNER JOIN producto P ON C.ID_P1 = P.ID_P WHERE C.ID_U1 = $_GET[ID_U1]";
    
    //Realiza la query a la DBz
    $registros = mysqli_query($conexion,$db_Ver_Carrito);

    //$datos=[];
    //Se recorre el resultado y se guarda en un array
    while($resultado = mysqli_fetch_array($registros)){
        $datos[] = $resultado;
    } 

    $json = json_encode($datos); //Genera el archivo JSON con los datos obtenidos

    echo $json; //Muestra el JSON generado

    header('Content-Type: application/json');
    
?>