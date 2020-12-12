import { Component, OnInit } from '@angular/core';
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

  constructor(public UsuarioCervice: UsuariosService) { }

  ngOnInit() {
  }

  salirU(){
    this.UsuarioCervice.datosUsuario[0] = '';
    this.UsuarioCervice.datosUsuario[1] = '';
  }

    Carrito(){
    const datos="hola que tal prueba uno";
    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: 'btn btn-success',
        cancelButton: 'btn btn-danger'
      },
      buttonsStyling: false
    })
    
    swalWithBootstrapButtons.fire({
      position: 'top-end',
      title: 'Carrito de Compra',
      text: `${datos}`,
      icon: 'info',
      showCancelButton: true,
      confirmButtonText: 'Comprar',
      cancelButtonText: 'Esperando',
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        swalWithBootstrapButtons.fire(
          'Compra exitosa',
          'Gracias por comprar con KuroNeko',
          'success'
        )
      } else if (
        /* Read more about handling dismissals below */
        result.dismiss === Swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire(
          'Compra en espera!',
          'Esperamos tus compras',
          'info'
        )
      }
    })
  }
}
