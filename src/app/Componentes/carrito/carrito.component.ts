import { Component, OnInit } from '@angular/core';
import { ProductoService } from 'src/app/Servicios/Productos/producto.service';
import { UsuariosService } from 'src/app/Servicios/Usuarios/usuarios.service';

@Component({
  selector: 'app-carrito',
  templateUrl: './carrito.component.html',
  styleUrls: ['./carrito.component.css']
})
export class CarritoComponent implements OnInit {

  
  ID_U1: any = this.UsuarioCervice.datosUsuario[0];

  CarritoV = null;

  carrito = {
    ID_C: null,
    FOTO_P: null,
    NOM_P: null,
    PRECIO: null,
    CANTIDAD: null
  }

  constructor(public UsuarioCervice: UsuariosService, public ProductoServicio: ProductoService) { }

  ngOnInit() {
    this.Carrito();
  }

  Carrito() {
    this.ObtenerCarrito(this.ID_U1);
    //console.log(this.carrito);
    //console.log(this.CarritoV);
    //console.log(this.UsuarioCervice.datosUsuario[0]);
  }
    /************************************/
    ObtenerCarrito(ID_U1) {
      this.ProductoServicio.ObtenerCarrito(ID_U1).subscribe(
        result => this.CarritoV = result
      );
    }

    EliminarCarrito(ID_C){
      this.ProductoServicio.BajaCarrito(ID_C).subscribe(
        datos => {
          if(datos['resultado'] == 'OK'){
            alert(datos['mensaje']);
            this.Carrito();
          }
        }
      );

    }


}
