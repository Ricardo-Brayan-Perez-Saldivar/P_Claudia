import { Injectable } from '@angular/core';

import {HttpClient} from '@angular/common/http';  //Permite comandos html

@Injectable({
  providedIn: 'root'
})

export class ProductoService {

  URL = "http://localhost/P_Claudia/src/app/API_CARRITO/"; //Variable mediante se realizara la conexion

  constructor(private http: HttpClient) { }

  obtenerProductos(PAIS,TIPO_P){
    return this.http.get(`${this.URL}ObtenerProductos.php?PAIS=${PAIS}&TIPO_P=${TIPO_P}`);
  }

  altaProducto(producto){
    return this.http.post(`${this.URL}AltaProducto.php`, JSON.stringify(producto));
  }

  seleccionarProducto(ID_P: number){
    return this.http.get(`${this.URL}seleccionarProducto.php?ID_P=${ID_P}`);
  }

  altaCarrito(carrito){
    return this.http.post(`${this.URL}altaCarrito.php`, JSON.stringify(carrito));
  }

  ObtenerCarrito(ID_U1: number){
    return this.http.get(`${this.URL}ObtenerCarrito.php?ID_U1=${ID_U1}`);
  }

  BajaCarrito(ID_C: number){
    return this.http.get(`${this.URL}BajaProductoC.php?ID_C=${ID_C}`);
  }

}
