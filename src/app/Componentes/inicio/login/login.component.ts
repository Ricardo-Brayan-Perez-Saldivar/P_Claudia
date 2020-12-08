import { Component, OnInit, ɵConsole } from '@angular/core';
import { RouterLink } from '@angular/router';
import { UsuariosService } from 'src/app/Servicios/Usuarios/usuarios.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginUs;

  login = {
    EMAIL: null,
    CONTRASENA: null
  };

  constructor(private UsuarioCervice: UsuariosService) { }

   redirecciona = "http://localhost:4200/LProducto";


  ngOnInit(): void {
  }

  LoginUsuario() {
    this.UsuarioCervice.loginUsuario(this.login).subscribe(
      datos =>{
        if(datos['resultado'] == 'OK'){
          alert(datos['mensaje']);
          window.location.href = this.redirecciona; //Redirecciona a la galeria de productos
        }else{
          alert(datos['mensaje']);
          console.log(datos);
        }
      }
    );
    console.log(this.login);
  }

}
