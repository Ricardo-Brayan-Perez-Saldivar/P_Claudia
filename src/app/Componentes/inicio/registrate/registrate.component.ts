import { Component, OnInit } from '@angular/core';
import Swal from 'sweetalert2';

//Importacion del servicio
import { UsuariosService } from '../../../Servicios/Usuarios/usuarios.service';

@Component({
  selector: 'app-registrate',
  templateUrl: './registrate.component.html',
  styleUrls: ['./registrate.component.css']
})
export class RegistrateComponent implements OnInit {

  //usuarios = null;

  usuario = {
    //variables usuario
    EMAIL: null,
    CONTRASENA: null,
    NOM_U: null,
    AP_P: null,
    AP_M: null,
    SEXO: null,
    EDAD: null,
    FOTO: null,
    SOBRENOMBRE: null,
    base64textString: null,
  };

  
  constructor(private servicioUsuario: UsuariosService) { }

  ngOnInit() {
    console.log(this.usuario);
    //this.obtenerUsuario();
    //this.resetear();
  }

   /*
    obtenerUsuario() {
      this.servicioUsuario.obtenerUsuarios().subscribe(
        result => this.usuarios = result
      );
  
      console.log(this.usuarios);
      console.log(this.usuario);
    }*/

    nuevoU(){
      this.servicioUsuario.altaUsuario(this.usuario).subscribe(
        datos => {
          if(datos['resultado'] == 'OK'){
            //alert(datos['mensaje']);
            Swal.fire({
              position: 'top-end',
              icon: 'success',
              title: `${datos['mensaje']}`,
              showConfirmButton: false,
              timer: 1500
            })
            console.log(this.usuario);
          }
        }
      );
      console.log(this.usuario);

      /*this.servicioUsuario.altaDomicilio(this.domicilio).subscribe(
        datos => {
          if(datos['resultado'] == 'OK'){
            alert(datos['mensaje']);
          }
        }
      );*/

    }
  
    seleccionarArchivo(event) {
      var files = event.target.files;
      var file = files[0];
      this.usuario.FOTO = file.name;
  
      if (files && file) {
        var reader = new FileReader();
        reader.onload = this._handleReaderLoaded.bind(this);
        reader.readAsBinaryString(file);
      }
    }
  
    _handleReaderLoaded(readerEvent) {
      var binaryString = readerEvent.target.result;
      this.usuario.base64textString = btoa(binaryString);
    }
    
  /*
    bajaUsuario(ID_U) {
      this.servicioUsuario.BajaUsuario(ID_U).subscribe(
        datos => {
          if (datos['resultado'] == 'OK') {
            alert(datos['mensaje']);
            this.obtenerUsuario();
            this.resetear();
          }
        }
      );
    }
  
    editarUsuario() {
      this.servicioUsuario.EditaUsuario(this.usuario).subscribe(
        datos => {
          if (datos['resultado'] == 'OK') {
            alert(datos['mensaje']);
            this.obtenerUsuario();
            this.resetear();
          }
        }
      );
    }
  
    seleccionarUsuario(ID_U) {
      this.servicioUsuario.seleccionUsuario(ID_U).subscribe(
        result => this.usuario = result[0]
      );
    }*/

  /*hayRegistros() {
    if (this.usuarios == null) {
      return false;
    } else {
      return true;
    }
  }*/


}
