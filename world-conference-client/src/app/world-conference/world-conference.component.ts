import { Component, OnInit } from '@angular/core';
import { City } from '../models/city';
import { Company } from '../models/company';
import { Country } from '../models/country';
import { User } from '../models/user';
import { WorldConferencePaginationService } from '../services/world-conference-pagination.service';
import { WorldConferenceService } from '../services/world-conference.service';

@Component({
  selector: 'app-world-conference',
  templateUrl: './world-conference.component.html',
  styleUrls: ['./world-conference.component.css']
})
export class WorldConferenceComponent implements OnInit {
  pageNo: any = 1; 
  pageNumber: boolean[] = [];
  sortOrder: any = 'CompanyName';
  pageField = [];  
  exactPageList: any;
  paginationData!: number;
  companiesPerPage: any = 1;
  totalCompanies: any;
  totalCompaniesCount: any;
  errorMessage!: string;  
  country_name: any;
  city_name: any;
  user_name: any;
  auxT: any[] = [];
  countryList!: Country[];
  cityList!: City[];
  userList!: User[];
  companies: Company[]=[];
  constructor(private worldConferenceService: WorldConferenceService,  public worldConferencePaginationService: WorldConferencePaginationService) { }

  ngOnInit(): void {
    this.country_name='';
    this.city_name='';
    this.user_name='';
    this.pageNumber[0] = true;
    this.worldConferencePaginationService.temppage = 0;  
    debugger;
    this.getCountry();
    this.getCity();
    this.getUser();
    this.searchCompanies(this.country_name,this.city_name,this.user_name);
  }

  public getCountry() {
    this.worldConferenceService.getCountry().subscribe(res => this.countryList = res, error => this.errorMessage = <any>error); 
  }

  public getCity() {
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

  searchCompanies(countryCode: string, cityName: string, userName: string){   
          this.worldConferenceService.searchCompanies(this.pageNo, this.companiesPerPage, countryCode,cityName,userName).subscribe((data: any) => {       
            this.companies = data;
            this.getAllCompaniesCount();            
          }) 
  }

   //Method For Pagination  

totalNoOfPages() {  

  this.paginationData = Number(this.totalCompaniesCount / this.companiesPerPage);
  let tempPageData = this.paginationData.toFixed();  
  if (Number(tempPageData) < this.paginationData) {
    this.exactPageList = Number(tempPageData) + 1; 
    this.worldConferencePaginationService.exactPageList = this.exactPageList;
  } else { 
    this.exactPageList = Number(tempPageData);
    this.worldConferencePaginationService.exactPageList = this.exactPageList
  } 
  this.worldConferencePaginationService.pageOnLoad(); 
  this.pageField = this.worldConferencePaginationService.pageField; 

}
  showCompaniesByPageNumber(page: any, i: number) {  
        this.companies = [];     
        this.pageNumber = [];    
        this.pageNumber[i] = true; 
        this.pageNo = page; 
        this.searchCompanies(this.country_name,this.city_name,this.user_name); 
      }

      getAllCompaniesCount() {
            this.worldConferenceService.getAllCompaniesCount(this.country_name,this.city_name,this.user_name).subscribe((res: any) => {
              this.totalCompaniesCount = res.CompaniesCount;
              this.totalNoOfPages(); 
            })
          }
}