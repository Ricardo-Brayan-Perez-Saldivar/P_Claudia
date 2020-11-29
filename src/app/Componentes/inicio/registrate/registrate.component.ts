import { Component, OnInit } from '@angular/core';


//Importacion del servicio
import { UsuariosService } from '../../../Servicios/Usuarios/usuarios.service';


@Component({
  selector: 'app-registrate',
  templateUrl: './registrate.component.html',
  styleUrls: ['./registrate.component.css'],
  providers: [UsuariosService],
})
export class RegistrateComponent implements OnInit {

  usuarios = null;

  usuario = ({
    id: [''],
    nombre: [''],
    ap: [''],
    am: [''],
    edad: [''],
    sexo: [''],
    foto: [''],
    sbnm: [''],
    email: [''],
    password: [''],
    calle: [''],
    colonia: [''],
    dm: [''],
    pais: ['']
  });

  constructor(private servicioUsuario: UsuariosService) { }

  ngOnInit() {
    this.obtenerUsuario();
  }

  obtenerUsuario() {
    this.servicioUsuario.obtenerUsuarios().subscribe(
      result => this.usuarios = result
    );
  }

  altaUsuario() {
    this.servicioUsuario.AltaUsuarios(this.usuario).subscribe(
      datos => {
        if (datos['resultado'] == 'OK') {
          alert((datos['mensaje']));
          this.obtenerUsuario();
        }
      }
    );
  }
  
  bajaUsuario(idUsuario){
    this.servicioUsuario.BajaUsuario(idUsuario).subscribe(
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
        if(datos['resultado'] == 'OK'){
          alert(datos['mensaje']);
          this.obtenerUsuario();
        }
      }
    );
  }

  seleccionarUsuario(idUsuario){
    this.servicioUsuario.seleccionUsuario(idUsuario).subscribe(
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
