import { Component, OnInit } from '@angular/core';

//Importacion del servicio
import { UsuariosService } from '../../../Servicios/Usuarios/usuarios.service';

@Component({
  selector: 'app-registrate',
  templateUrl: './registrate.component.html',
  styleUrls: ['./registrate.component.css']
})
export class RegistrateComponent implements OnInit {

  usuarios = null;

  usuario = {
    ID_U: null,
    NOM_U: null,
    AP_P: null,
    AP_M: null,
    EDAD: null,
    SEXO: null,
    FOTO: null,
    SOBRENOMBRE: null,
    EMAIL: null,
    CONTRASENA: null,
    ID_CALLE1: null,
    ID_COL1: null,
    ID_DM1: null,
    ID_PA1: null};

  constructor(private servicioUsuario: UsuariosService) { }

  ngOnInit() {
    this.obtenerUsuario();    
    
  }

  resetear(){
    this.usuario = {
      ID_U: '',
      NOM_U: '',
      AP_P: '',
      AP_M: '',
      EDAD: '',
      SEXO: '',
      FOTO: '',
      SOBRENOMBRE: '',
      EMAIL: '',
      CONTRASENA: '',
      ID_CALLE1: '',
      ID_COL1: '',
      ID_DM1: '',
      ID_PA1: ''};
  }

  obtenerUsuario() {
    this.servicioUsuario.obtenerUsuarios().subscribe( 
      result => this.usuarios = result 
      );

    console.log(this.usuarios);
    console.log(this.usuario);
  }

  altaUsuario() {
    this.servicioUsuario.altaUsuario(this.usuario).subscribe(
      datos => {
        if(datos['resultado'] == 'OK') {
          alert(datos['mensaje']);
          this.obtenerUsuario();
          this.resetear();
        }
      }
    );
    
  }
  
  bajaUsuario(ID_U){
    this.servicioUsuario.BajaUsuario(ID_U).subscribe(
      datos => {
        if(datos['resultado'] == 'OK'){
          alert(datos['mensaje']);
          this.obtenerUsuario();
        }
      }
    );
  }

  editarUsuario(){
    this.servicioUsuario.EditaUsuario(this.usuario).subscribe(
      datos => {
        if(datos['resultado']=='OK'){
          alert(datos['mensaje']);
          this.obtenerUsuario();
        }
      }
    );
  }

  seleccionarUsuario(ID_U){
    this.servicioUsuario.seleccionUsuario(ID_U).subscribe(
      result => this.usuario = result[0]
    );
  }

  hayRegistros(){
    if(this.usuarios == null){
      return false;
    }else {
      return true;
    }
  }

}
