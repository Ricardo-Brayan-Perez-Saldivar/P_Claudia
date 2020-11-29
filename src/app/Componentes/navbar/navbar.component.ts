import { Component, OnInit } from '@angular/core';
import Swal from 'sweetalert2';
//import Swal from 'sweetalert2';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  logo = 'assets/Image/KuroNeko.png';

  constructor() { }

  ngOnInit(): void {
  }

  datos= "hola";

  Carrito(datos){
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
      text: `${{datos}}`,
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
