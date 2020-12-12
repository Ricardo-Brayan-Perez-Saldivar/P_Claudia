import { Component, OnInit, ɵConsole } from '@angular/core';
import { RouterLink } from '@angular/router';
import { UsuariosService } from 'src/app/Servicios/Usuarios/usuarios.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginUs=null;

  loginU = { 
    ID_U:null, 
    SOBRENOMBRE:null
  }

  login = {
    EMAIL: null,
    CONTRASENA: null
  };

  constructor(private UsuarioCervice: UsuariosService) {}

   redirecciona = "http://localhost:4200/LProducto";


  ngOnInit(): void {
  }

  LoginUsuario() {
    
    this.UsuarioCervice.loginUsuario(this.login).subscribe(
      datos =>{
        if(datos['resultado'] == 'OK'){
          Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: `${datos['mensaje']}`,
            showConfirmButton: false,
            timer: 1500
          })
          //alert(datos['mensaje']);
         // window.location.href = this.redirecciona; //Redirecciona a la galeria de productos
        }else{
          Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: `${datos['mensaje']}`,
            showConfirmButton: false,
            timer: 1500
          })
          //alert(datos['mensaje']);
          console.log(datos);
        }
      }
    );

    this.UsuarioCervice.ObtenerLogin(this.login).subscribe(
      result => this.loginUs = result
    );

    this.UsuarioCervice.datosUsuario[0]='2';
    this.UsuarioCervice.datosUsuario[1]='ROCKO';
    console.log(this.login);
  }

}
