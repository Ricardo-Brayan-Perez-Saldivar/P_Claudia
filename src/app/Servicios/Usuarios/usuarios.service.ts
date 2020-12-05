import { Injectable } from '@angular/core';

import {HttpClient} from '@angular/common/http';  //Permite comandos html

@Injectable({
  providedIn: 'root'
})
export class UsuariosService {

  URL = "http://localhost/P_Claudia/src/app/API_CARRITO/"; //Variable mediante se realizara la conexion
  constructor(private http: HttpClient) { }

  /*obtenerUsuarios(){
    return this.http.get(`${this.URL}ObtenerUsuarios.php`);
  }*/

  altaUsuario(usuario){
    return this.http.post(`${this.URL}AltaUsuarioC.php`,JSON.stringify(usuario));
  }

  altaDomicilio(domicilio){
    return this.http.post(`${this.URL}AltaDomicilio.php`, JSON.stringify(domicilio));
  }
/*
  BajaUsuario(ID_U: number){
    return this.http.get(`${this.URL}BajaUsuario.php?ID_U=${ID_U}`);
  }

  seleccionUsuario(ID_U: number){
    return this.http.get(`${this.URL}SeleccionarU.php?ID_U=${ID_U}`);
  }

  EditaUsuario(usuario){
    return this.http.post(`${this.URL}EditarUsuario.php`,JSON.stringify(usuario));
  }

  uploadFile(usuario) {
    return this.http.post(`${this.URL}subirArchivo.php`, JSON.stringify(usuario));
  }*/

}
