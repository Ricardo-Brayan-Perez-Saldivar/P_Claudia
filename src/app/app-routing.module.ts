import{NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';
import { CarritoComponent } from './Componentes/carrito/carrito.component';

import { ContactanosComponent } from './Componentes/Inicio/contactanos/contactanos.component';
import { InicioComponent } from './Componentes/inicio/inicio.component';
import { LoginComponent } from './Componentes/Inicio/login/login.component';
import { PagosComponent } from './Componentes/Inicio/pagos/pagos.component';
import { PoliticasComponent } from './Componentes/Inicio/politicas/politicas.component';
import { RegistrateComponent } from './Componentes/Inicio/registrate/registrate.component';
import { ProductoListaComponent } from './Componentes/Productos/producto-lista/producto-lista.component';
import { ProductoComponent } from './Componentes/Productos/producto/producto.component';

const routes: Routes = [
    {path:'',component:InicioComponent,pathMatch:'full'},
    {path: 'NProducto', component:ProductoComponent},
    {path: 'LProducto', component: ProductoListaComponent},
    {path: 'Contactanos', component: ContactanosComponent},
    {path: 'Politicas',component: PoliticasComponent},
    {path: 'Pagos', component: PagosComponent},
    {path: 'Login', component: LoginComponent},
    {path: 'Registrate', component: RegistrateComponent},
    {path: 'Carrito', component: CarritoComponent}

];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})
export class AppRoutingModule { }

