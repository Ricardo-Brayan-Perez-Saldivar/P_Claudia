import { Injectable } from '@angular/core';

import {HttpClient} from '@angular/common/http';  //Permite comandos html
import { from } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class UsuariosService {

  URL = "API/"; //Variable mediante se realizara la conexion

  constructor(private http: HttpClient) { }

  obtenerUsuarios(){
    return this.http.get(`${this.URL}/ObtenerUsuarios.php`);
  }

  AltaUsuarios(usuario){
    return this.http.post(`${this.URL}/AltaUsuario.php`, JSON.stringify(usuario));
  }

  BajaUsuario(idUsuario: number){
    return this.http.get(`${this.URL}/BajaUsuario.php?ID_U=${idUsuario}`);
  }

  seleccionUsuario(idUsuario: number){
    return this.http.get(`${this.URL}SeleccionarU.php?ID_U=${idUsuario}`);
  }

  EditaUsuario(usuario){
    return this.http.post(`${this.URL}EditarUsuario.php`,JSON.stringify(usuario));
  }

}
