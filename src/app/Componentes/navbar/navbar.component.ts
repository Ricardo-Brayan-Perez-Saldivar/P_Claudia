import { Component, OnInit, ɵConsole } from '@angular/core';
import { ProductoService } from 'src/app/Servicios/Productos/producto.service';
import { UsuariosService } from 'src/app/Servicios/Usuarios/usuarios.service';
import Swal from 'sweetalert2';
//import Swal from 'sweetalert2';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  logo = 'assets/Image/KuroNeko.png';

  constructor(public UsuarioCervice: UsuariosService, public ProductoServicio: ProductoService) { }

  ngOnInit() {
  }

  salirU() {
    this.UsuarioCervice.datosUsuario[0] = '';
    this.UsuarioCervice.datosUsuario[1] = '';
  }

  }
