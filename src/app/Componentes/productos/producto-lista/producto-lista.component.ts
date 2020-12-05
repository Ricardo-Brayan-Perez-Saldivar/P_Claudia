import { Component, OnInit } from '@angular/core';

import { ProductoService } from 'src/app/Servicios/Productos/producto.service';

import Swal from 'sweetalert2';

@Component({
  selector: 'app-producto-lista',
  templateUrl: './producto-lista.component.html',
  styleUrls: ['./producto-lista.component.css']
})
export class ProductoListaComponent implements OnInit {

  constructor(private servicioProducto: ProductoService) { }

  productos = null;

  producto = {
    ID_P: null,
    NOM_P: null,
    PRECIO: null,
    DESCRIPCION: null,
    TIPO_P: null,
    CANTIDAD_E: null,
    FOTO_P: null,
    PAIS: null,
    FECHA_CP: null,
    base64textString: null
  };

  ngOnInit() {
    this.obtenerProductos();    
  }



  obtenerProductos(){
    this.servicioProducto.obtenerProductos().subscribe(
      result => this.productos = result
    );
    console.log(this.producto);
    console.log(this.productos);

  }

  compraR() {
    Swal.fire({
      position: 'top-end',
      icon: 'success',
      title: 'Agregado',
      text: 'Producto agregado exitosamente al carrito',
      showConfirmButton: false,
      timer: 1500
    })
  }

  alerta() {
    Swal.fire({
      title: 'Crea una nueva Artesania',
      html: '<app-artesania></app-artesania>',
      icon: 'success',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si'
    })
      .then(resultado => {
        if (resultado.value) {
          // Hicieron click en "Sí"
          console.log("*se creara la artesania*");
          this.CreacionA();
        } else {
          // Dijeron que no
          console.log("*NO se creara la artesania*");
        }
      });
  }

  CreacionA() {
    Swal.fire({
      title: 'Nueva Artesania',
      input: "text",
      showDenyButton: true,
      showCancelButton: true,
      confirmButtonText: `Crear`,
      denyButtonText: `Cancelar`,

      inputValidator: nombre => {
        if (!nombre) { return "Pon tu nombre completo"; }
        else { return undefined; }
      }

    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {

        if (result.value) {
          let nombre = result.value;
          console.log(`Se a guardado la Artesania,${nombre}`);
        }

        Swal.fire('Guardada con exito!', '', 'success')
      } else if (result.isDenied) {
        console.log('Se cancelo proceso');
        Swal.fire('Se cancelo proceso', '', 'info')
      }
    })
  }

  hayRegistros() {
    if (this.producto == null) {
      return false;
    } else {
      return true;
    }
  }
}
