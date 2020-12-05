<?php 
    header('Access-Control-Allow-Origin: *'); 
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    
    //Variables a ocupar
    $json = file_get_contents('php://input');
    $params = json_decode($json);

    require("conexion.php");  //Se importa el archivo con la conexion

    $conexion = conexion();  //Se crea la conexion
    //apartado donde se crea la ruta de la imagen
    $nombreArchivo = $params->FOTO;
    $archivo = $params->base64textString;
    $archivo = base64_decode($archivo);

    //ruta a la cual se ba a guardar la imagen
    $filePath = $_SERVER['DOCUMENT_ROOT']."/P_Claudia/src/assets/Image/".$nombreArchivo;
    //ruta que se mostrara
    $path = "assets/Image/".$nombreArchivo;
    //Movimiento de imagena la carpeta
    file_put_contents($filePath, $archivo);

    //Operacion de Actualizar
    $EditarU = "UPDATE USUARIO SET NOM_U='$params->NOM_U', 
                                    AP_P='$params->AP_P',
                                    AP_M='$params->AP_M',
                                    EDAD=$params->EDAD,
                                    SEXO='$params->SEXO',
                                    FOTO='$path',
                                    SOBRENOMBRE='$params->SOBRENOMBRE', 
                                    EMAIL='$params->EMAIL',
                                    CONTRASENA='$params->CONTRASENA',
                                    ID_CALLE1=$params->ID_CALLE1,
                                    ID_COL1=$params->ID_COL1,
                                    ID_DM1=$params->ID_DM1,
                                    ID_PA1=$params->ID_PA1
                                    WHERE ID_U=$params->ID_U";

    //Se realiza la QUERY a la base de datos
    mysqli_query($conexion, $EditarU);

    class Result {}

    //Genera los datos de respuesta
    $response = new Result();
    $response->resultado = 'OK';
    $response->mensaje = 'EL USUARIO SE ACTUALIZO EXITOSAMENTE';

    header('Content-Type: application/json');

    echo json_encode($response);  //Se muestra el JSON generado
?>