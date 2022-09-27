import { Component, OnInit} from '@angular/core';
import { City } from '../models/city';
import { Country } from '../models/country';
import { User } from '../models/user';
import { WorldConferencePaginationService } from '../services/world-conference-pagination.service';
import { WorldConferenceService } from '../services/world-conference.service';

@Component({
  selector: 'app-world-conference',
  templateUrl: './world-conference.component.html',
  styleUrls: ['./world-conference.component.css'],
})
export class WorldConferenceComponent implements OnInit {
  pageNo: any = 1;
  pageNumber: boolean[] = [];
  companiesPerPage: any = 2;
  //totalCompanies: any;
  totalCompaniesCount: any;  
  pageField = [];  
  exactPageList: any;
  paginationData!: number;  

  errorMessage!: string;
  companyCount: number = 0;
  country_name: any;
  city_name: any;
  user_name!: string; 
  countryList!: Country[];
  cityList!: City[];
  userList: User[]=[];
  dataSource: CompaniesElement[] = [];
  displayedColumns: any[] = [
    'companyName',
    'countryCode',
    'cityName',
    'userName',
  ];

  constructor(
    private worldConferenceService: WorldConferenceService,
    public worldConferencePaginationService: WorldConferencePaginationService
  ) {}

  ngOnInit(): void {
    this.country_name = '';
    this.city_name = '';
    this.user_name = '';
    this.pageNumber[0] = true;
    this.worldConferencePaginationService.temppage = 0;
    this.getCountry();
    this.getCity();
    this.getUser();
    this.searchCompanies(this.country_name, this.city_name, this.user_name);
  }
  public getCountry() {
    this.worldConferenceService.getCountry().subscribe(
      (res) => (this.countryList = res),
      (error) => (this.errorMessage = <any>error)
    );
  }

  public getCity() {
    this.worldConferenceService.getCity().subscribe(
      (res) => (this.cityList = res),
      (error) => (this.errorMessage = <any>error)
    );
  }
  public getUser() {
    this.worldConferenceService.getUser().subscribe(
      (res) => (this.userList = res),
      (error) => (this.errorMessage = <any>error)
    );
  }
  searchDelegate() {
    if (
      this.country_name === null ||
      this.country_name === undefined ||
      this.country_name === ''
    ) {
      alert(this.country_name);
      alert('Please Select Country.');
    }
    if (
      this.country_name === null ||
      this.country_name === undefined ||
      this.country_name === ''
    ) {
      alert('Please Select City.');
    } else if (
      this.country_name === null ||
      this.country_name === undefined ||
      this.country_name === ''
    ) {
      alert('Please Select Country!');
    } else {
      this.searchCompanies(this.country_name, this.city_name, this.user_name);      
    }
  }

  searchCompanies(countryCode: string, cityName: string, userName: string) {
    this.worldConferenceService
      .searchCompanies(
        this.pageNo,
        this.companiesPerPage,
        countryCode,
        cityName,
        userName
      )
      .subscribe((data: any) => {
        this.dataSource = data;
        this.companyCount = data.length;
        this.getAllCompaniesCount();
      });
  }
  
  public filteredList = this.userList.slice();

  getAllCompaniesCount() {
    this.worldConferenceService
      .getAllCompaniesCount(this.country_name, this.city_name, this.user_name)
      .subscribe((res: any) => {
        this.totalCompaniesCount = res.CompaniesCount;
        this.totalNoOfPages();
      });
  }

  totalNoOfPages() {
    this.paginationData = Number(
      this.totalCompaniesCount / this.companiesPerPage
    );
    let tempPageData = this.paginationData.toFixed();
    if (Number(tempPageData) < this.paginationData) {
      this.exactPageList = Number(tempPageData) + 1;
      this.worldConferencePaginationService.exactPageList = this.exactPageList;
    } else {
      this.exactPageList = Number(tempPageData);
      this.worldConferencePaginationService.exactPageList = this.exactPageList;
    }
    this.worldConferencePaginationService.pageOnLoad();
    this.pageField = this.worldConferencePaginationService.pageField;
  }
  showCompaniesByPageNumber(page: any, i: number) {
    this.dataSource = [];
    this.pageNumber = [];
    this.pageNumber[i] = true;
    this.pageNo = page;
    this.searchCompanies(this.country_name, this.city_name, this.user_name);
  }
}

export interface CompaniesElement {
  companyName: string;
  countryCode: number;
  cityName: number;
  userName: string;
}
