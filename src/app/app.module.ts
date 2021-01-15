import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

//Componentes que se ocuparan
import { AppComponent } from './app.component';
import { ProductosComponent } from './Componentes/productos/productos.component';
import { ProductoComponent } from './Componentes/Productos/producto/producto.component';
import { ProductoListaComponent } from './Componentes/Productos/producto-lista/producto-lista.component';
import { InicioComponent } from './Componentes/inicio/inicio.component';
import { ContactanosComponent } from './Componentes/Inicio/contactanos/contactanos.component';
import { LoginComponent } from './Componentes/Inicio/login/login.component';
import { RegistrateComponent } from './Componentes/Inicio/registrate/registrate.component';
import { PagosComponent } from './Componentes/Inicio/pagos/pagos.component';
import { PoliticasComponent } from './Componentes/Inicio/politicas/politicas.component';
import { NavbarComponent } from './Componentes/navbar/navbar.component';

//Modelo
import { FormsModule } from '@angular/forms';

//Servicio de http
import { HttpClientModule } from '@angular/common/http';

//Servicios
import { ProductoService } from './Servicios/Productos/producto.service';
import { UsuariosService } from './Servicios/Usuarios/usuarios.service';

//Rutas a ocupar
import { AppRoutingModule } from '../app/app-routing.module';
import { CarritoComponent } from './Componentes/carrito/carrito.component';
import { OrdenComponent } from './Componentes/orden/orden.component';

@NgModule({
  declarations: [
    AppComponent,
    ProductosComponent,
    ProductoComponent,
    ProductoListaComponent,
    InicioComponent,
    ContactanosComponent,
    LoginComponent,
    RegistrateComponent,
    PagosComponent,
    PoliticasComponent,
    NavbarComponent,
    CarritoComponent,
    OrdenComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule, 
    AppRoutingModule
  ],
  providers: [
    ProductoService,
    UsuariosService,
    LoginComponent
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
