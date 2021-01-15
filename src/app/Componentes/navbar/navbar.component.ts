import { Component, OnInit, ɵConsole } from '@angular/core';
import { ProductoService } from 'src/app/Servicios/Productos/producto.service';
import { UsuariosService } from 'src/app/Servicios/Usuarios/usuarios.service';

import{OrdenComponent} from 'src/app/Componentes/orden/orden.component';

import Swal from 'sweetalert2';
import { timer } from 'rxjs';
//import Swal from 'sweetalert2';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  logo = 'assets/Image/KuroNeko.png';
  pago = 'assets/Image/pago_Efectivo.png';
  Paypal = 'assets/Image/paypal.png';
  
//Variables para el domicilio y el tipo de pago
  domicilio = {
    ID_U2: null,
    CALLE: null,
    N_EXT: null,
    N_INT: null,
    COLONIA: null,
    CIUDAD: null,
    CP: null,
    PAIS: null
  }
Pago = {
  TP: null
}

vari = this.Pago.TP;

  constructor(public UsuarioCervice: UsuariosService, public ProductoServicio: ProductoService) { }

  ngOnInit() {
    console.log(this.Pago.TP);
  }

  salirU() {
    this.UsuarioCervice.datosUsuario[0] = '0';
    this.UsuarioCervice.datosUsuario[1] = '';
  }

  hayCarrito(){
    if(this.UsuarioCervice.datosUsuario[0] == '0'){
      return false;
    }else{
      return true;
    }
  }

  Fin(){
    this.Proceso();
    console.log(this.vari);
    this.Finalizado();
    
  }

  Proceso(){
    
    Swal.fire({
      position: 'top-end',
      icon: 'info',
      title: 'Procesando Operacion',
      showConfirmButton: false,
      timer: 6000
    })
  }

  Finalizado(){
    
    Swal.fire({
      position: 'top-end',
      icon: 'success',
      title: 'Operacion exitosa',
      showConfirmButton: false,
      timer: 2000
    })
    
  }

  cero(){
    this.Pago.TP=null;
    console.log(this.Pago.TP);
  }

  }
