import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { TopComponent } from './top/top.component';
import { ShortenerComponent } from './shortener/shortener.component';

const routes: Routes = [
  {path: 'top', component: TopComponent},
  {path: 'shortener', component: ShortenerComponent},
  {path: '', redirectTo: '/shortener', pathMatch: 'full'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
