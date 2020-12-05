import { Component, OnInit } from '@angular/core';

import { ProductoService } from '../../../Servicios/Productos/producto.service';

@Component({
  selector: 'app-producto',
  templateUrl: './producto.component.html',
  styleUrls: ['./producto.component.css']
})
export class ProductoComponent implements OnInit {
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

  constructor(private servicioProducto: ProductoService) { }

  ngOnInit(): void {
  }

  nuevoP(){
    this.servicioProducto.altaProducto(this.producto).subscribe(
      datos => {
        if(datos['resultado'] == 'OK'){
          alert(datos['mensaje']);
          console.log(this.producto);
        }
      }
    );
    
  }

  seleccionarArchivo(event) {
    var files = event.target.files;
    var file = files[0];
    this.producto.FOTO_P = file.name;

    if (files && file) {
      var reader = new FileReader();
      reader.onload = this._handleReaderLoaded.bind(this);
      reader.readAsBinaryString(file);
    }
  }

  _handleReaderLoaded(readerEvent) {
    var binaryString = readerEvent.target.result;
    this.producto.base64textString = btoa(binaryString);
  }

}
