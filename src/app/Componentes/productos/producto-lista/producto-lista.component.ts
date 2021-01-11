import { Component, OnInit } from '@angular/core';

import { ProductoService } from 'src/app/Servicios/Productos/producto.service';
import { UsuariosService } from 'src/app/Servicios/Usuarios/usuarios.service';

import Swal from 'sweetalert2';

@Component({
  selector: 'app-producto-lista',
  templateUrl: './producto-lista.component.html',
  styleUrls: ['./producto-lista.component.css']
})
export class ProductoListaComponent implements OnInit {

  constructor(private servicioProducto: ProductoService, private UsuarioServicio: UsuariosService) { }

  productos = null;

  ID_U: any = this.UsuarioServicio.datosUsuario[0];

  PAIS = "México";
  TIPO_P = "A";
  
  producto = {
    ID_P: null,
    NOM_P: null,
    PRECIO: null,
    DESCRIPCION: null,
    TIPO_P: null,
    CANTIDAD_E: null,
    FOTO_P: null,
    PAIS: null,
    base64textString: null
  };

  carrito = {
    ID_U1: null,
    ID_P1: null,
    CANTIDAD: null
  }

  ngOnInit() {
    this.Pais();
    console.log(this.producto);
    console.log(this.productos);
    //console.log(this.categoria);
  }

  /*carritoP(){
    this.carritoProducto();
    this.Carrito();
  }*/

  carritoProducto(ID_P) {
    //Optencion dedatos y guardado en carrito
    //this.Carrito();
    this.seleccionarProducto(ID_P);
    this.seleccionarUsuario(this.ID_U);
    console.log(this.carrito);
  }
  /*Seleccion de ID`s para usuario y producto*/
  seleccionarProducto(ID_P) {
    this.servicioProducto.seleccionarProducto(ID_P).subscribe(
      result => this.carrito.ID_P1 = result[0][0]
    );
    //console.log(this.carrito);
  }

  seleccionarUsuario(ID_U) {
    this.UsuarioServicio.seleccionarUsuario(ID_U).subscribe(
      result => this.carrito.ID_U1 = result[0][0]
    );
  }
  /****************************************/

  Carrito() {
    this.servicioProducto.altaCarrito(this.carrito).subscribe(
      datos => {
        if (datos['resultado'] == 'OK') {
          Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: `${datos['mensaje']}`,
            showConfirmButton: false,
            timer: 1500
          })
          console.log(this.carrito);
        }
      }
    );

  }


  /********Obtencion de los productos para visualizarlos************/
  Pais(){
    this.obtenerProductos(this.PAIS,this.TIPO_P);
    console.log(this.PAIS);
    console.log(this.TIPO_P);
    console.log(this.productos);
  }

  obtenerProductos(PAIS,TIPO_P) {
    this.servicioProducto.obtenerProductos(PAIS,TIPO_P).subscribe(
      result => this.productos = result
    );
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
