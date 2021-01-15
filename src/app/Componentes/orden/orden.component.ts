import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-orden',
  templateUrl: './orden.component.html',
  styleUrls: ['./orden.component.css']
})
export class OrdenComponent implements OnInit {

  constructor() { }
  domicilio = {
    //variables domicilio
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
  ngOnInit(): void {
  }

}
