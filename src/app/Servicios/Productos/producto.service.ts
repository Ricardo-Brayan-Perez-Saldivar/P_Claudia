import { Injectable } from '@angular/core';

import {HttpClient} from '@angular/common/http';  //Permite comandos html

@Injectable({
  providedIn: 'root'
})
export class ProductoService {

  URL = "http://192.168.0.8/api"; //Variable mediante se realizara la conexion

  constructor(private http: HttpClient) { }

  obtenerProductos(){
    return this.http.get(`${this.URL}ObtenerProductos.php`);
  }

  AltaProducto(producto){
    return this.http.post(`${this.URL}AltaProducto.php`, JSON.stringify(producto));
  }

  BajaProducto(idProducto: number){
    return this.http.get(`${this.URL}BajaProductos.php?ID_P=${idProducto}`);
  }

  seleccionProducto(idProducto: number){
    return this.http.get(`${this.URL}SeleccionarProductos.php?ID_P=${idProducto}`);
  }

  EditaProducto(producto){
    return this.http.post(`${this.URL}EditarProducto.php`,JSON.stringify(producto));
  }


}
