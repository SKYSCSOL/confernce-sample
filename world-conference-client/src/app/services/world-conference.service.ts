import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '@environment';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { ApiConfig } from '../config/apiConfig';

@Injectable({
  providedIn: 'root'
})
export class WorldConferenceService {
  private rootUrl: string;
  private conferenceAPIUrl;

  constructor(private http: HttpClient) {
    this.rootUrl = environment.apiRootUrl;
    this.conferenceAPIUrl = ApiConfig.ConferenceApiConfig;
  }

  getCountry(): Observable<any> {
    return this.http.get(`${this.rootUrl}${this.conferenceAPIUrl.getCountry}`)
      .pipe(
        tap(() => {
          //
        })
      );
  }

  getCity(): Observable<any> {
    return this.http.get(`${this.rootUrl}${this.conferenceAPIUrl.getCity}`)
      .pipe(
        tap(() => {
          //
        })
      );
  }

  getUser(): Observable<any> {
    return this.http.get(`${this.rootUrl}${this.conferenceAPIUrl.getUser}`)
      .pipe(
        tap(() => {
          //
        })
      );
  }

  searchCompanies(pageNo:number,pageSize: number,countryCode: string, cityName: string, userName: string): Observable<any> {       
        let parameters= '?pageNo=' + pageNo+'&pageSize='+pageSize+'&countryCode='+countryCode+'&cityName='+cityName+'&userName='+userName;
        return this.http.get(`${this.rootUrl}${this.conferenceAPIUrl.searchCompany}` + parameters)
      }

      getAllCompaniesCount(countryCode: string, cityName: string, userName: string): Observable<any> {     
        let parameters= '?countryCode='+countryCode+'&cityName='+cityName+'&userName='+userName;       
            return this.http.get(`${this.rootUrl}${this.conferenceAPIUrl.getAllCompaniesCount}` + parameters);
          }

  getAllUserByCompanyName(companyName: string): Observable<any> {     
    let parameters= '?companyName='+companyName;       
    return this.http.get(`${this.rootUrl}${this.conferenceAPIUrl.getAllUserByCompanyName}` + parameters);
    }
}