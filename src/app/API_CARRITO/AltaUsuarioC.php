<?php
    //Permiten realizar una comprobacion a la conexion de la vase de datos
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    
    //Variables
    $json = file_get_contents('php://input'); //Resibe el JSON de Angular
    $params = json_decode($json); //Decodificar en JSON y lo guarda en esta variable

    require("conexionC.php"); //Importa el archivo con la conexion

    $conexion = conexion();  //Crear la conexion

    //apartado donde se crea la ruta de la imagen
    $nombreArchivo = $params->FOTO;
    $archivo = $params->base64textString;
    $archivo = base64_decode($archivo);

    //ruta a la cual se ba a guardar la imagen
    $filePath = $_SERVER['DOCUMENT_ROOT']."/P_Claudia/src/assets/Image/Usuarios/".$nombreArchivo;
    //ruta que se mostrara
    $path = "assets/Image/Usuarios/".$nombreArchivo;
    //Movimiento de imagena la carpeta
    file_put_contents($filePath, $archivo);
    
    //Operacion de insercion de producto
    
    $pa_ING_USUARIO = "CALL ING_USUARIO('$params->EMAIL', 
    '$params->CONTRASENA', '$params->NOM_U', '$params->AP_P', 
    '$params->AP_M,','$params->SEXO', $params->EDAD, '$path', 
    '$params->SOBRENOMBRE')";
    //$foto = "UPDATE USUARIO SET FOTO='$filePath' WHERE ID_U=$params->ID_U ";

    //Se realizara la QUERY a la base de datos
    mysqli_query($conexion,$pa_ING_USUARIO);

    class Result{}

    //Se generan los datos de respuesta
    $response = new Result();
    $response->resultado = 'OK';
    $response->mensaje = 'SE REGISTRO EL USUARIO EXITOSAMENTE XD :)';

    header('Content-Type: application/json');

    echo json_encode($response);  //Muestra el JSON que se genero


?>