import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { WorldConferenceComponent } from './world-conference/world-conference.component';
import { NoopAnimationsModule } from '@angular/platform-browser/animations';
import {MatSelectModule} from '@angular/material/select';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import {MatSidenavModule} from '@angular/material/sidenav'
import {MatIconModule} from '@angular/material/icon';
import {MatListModule} from '@angular/material/list';
import { MatSelectFilterModule } from 'mat-select-filter';
import { WorldConferencePaginationService } from './services/world-conference-pagination.service';
import { MatTableModule } from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator'; 
import { NgxMatSelectSearchModule } from 'ngx-mat-select-search';
import { UserByCompanyComponent } from './user-by-company/user-by-company.component';


@NgModule({
  declarations: [
    AppComponent,
    WorldConferenceComponent,
    UserByCompanyComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    NoopAnimationsModule,
    MatSelectModule,
    HttpClientModule,
    MatSidenavModule,
    MatIconModule,
    MatListModule,
    MatSelectFilterModule,
    MatTableModule,
    MatPaginatorModule,
    NgxMatSelectSearchModule,
    
  ],
  providers: [WorldConferencePaginationService],
  bootstrap: [AppComponent]
})
export class AppModule { }
