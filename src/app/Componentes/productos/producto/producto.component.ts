import { Component, OnInit } from '@angular/core';

import { ProductoService } from '../../../Servicios/Productos/producto.service';

@Component({
  selector: 'app-producto',
  templateUrl: './producto.component.html',
  styleUrls: ['./producto.component.css']
})
export class ProductoComponent implements OnInit {
  productos = null;

  constructor() { }

  ngOnInit(): void {
  }

}
