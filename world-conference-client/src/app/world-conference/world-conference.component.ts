import { Component, OnInit } from '@angular/core';
import { City } from '../models/city';
import { Country } from '../models/country';
import { User } from '../models/user';
import { WorldConferenceService } from '../services/world-conference.service';

@Component({
  selector: 'app-world-conference',
  templateUrl: './world-conference.component.html',
  styleUrls: ['./world-conference.component.css']
})
export class WorldConferenceComponent implements OnInit {
  errorMessage!: string;  
  country_name: any;
  city_name: any;
  user_name: any;
  auxT: any[] = [];
  countryList!: Country[];
  cityList!: City[];
  userList!: User[];
  constructor(private worldConferenceService: WorldConferenceService) { }

  ngOnInit(): void {
    debugger;
    this.getCountry();
    this.getCity();
    this.getUser();
  }

  public getCountry() { 
    //debugger;  
    this.worldConferenceService.getCountry().subscribe(res => this.countryList = res, error => this.errorMessage = <any>error); 
  }

  public getCity() { 
    //debugger;  
    this.worldConferenceService.getCity().subscribe(res => this.cityList = res, error => this.errorMessage = <any>error); 
  }
  public getUser() { 
    debugger;  
    this.worldConferenceService.getUser().subscribe(res => this.userList = res, error => this.errorMessage = <any>error); 
    debugger;
  }
  searchDelegate()
  {
    if (this.user_name != null) {
      for (let t of this.user_name) {
        this.auxT.push(t);
        console.log(this.auxT);
      }
    }
  }

  //public filteredList1 = this.userList.name.slice();

}
