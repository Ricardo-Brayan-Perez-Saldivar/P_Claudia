import { Injectable } from '@angular/core';

import {HttpClient} from '@angular/common/http';  //Permite comandos html

@Injectable({
  providedIn: 'root'
})
export class ProductoService {

  URL = "http://localhost/P_Claudia/src/app/API_CARRITO/"; //Variable mediante se realizara la conexion

  constructor(private http: HttpClient) { }

  obtenerProductos(){
    return this.http.get(`${this.URL}ObtenerProductos.php`);
  }

  altaProducto(producto){
    return this.http.post(`${this.URL}AltaProducto.php`, JSON.stringify(producto));
  }

}
