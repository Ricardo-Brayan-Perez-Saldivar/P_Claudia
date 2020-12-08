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
    $nombreArchivo = $params->FOTO_P;
    $archivo = $params->base64textString;
    $archivo = base64_decode($archivo);

    //ruta a la cual se ba a guardar la imagen
    $filePath = $_SERVER['DOCUMENT_ROOT']."/P_Claudia/src/assets/Image/Productos/".$nombreArchivo;
    //ruta que se mostrara
    $path = "assets/Image/Productos/".$nombreArchivo;
    //Movimiento de imagena la carpeta
    file_put_contents($filePath, $archivo);
    
    //Operacion de insercion de producto
    
    $pa_ING_PRODUCTO = "CALL ING_PRODUCTO('$params->NOM_P', $params->PRECIO, '$params->DESCRIPCION',
                        '$params->TIPO_P', $params->CANTIDAD_E, '$path', '$params->PAIS')";

    //Se realizara la QUERY a la base de datos
    mysqli_query($conexion,$pa_ING_PRODUCTO);

    class Result{}

    //Se generan los datos de respuesta
    $response = new Result();
    $response->resultado = 'OK';
    $response->mensaje = 'SE REGISTRO EL PRODUCTO EXITOSAMENTE';

    header('Content-Type: application/json');

    echo json_encode($response);  //Muestra el JSON que se genero


?>