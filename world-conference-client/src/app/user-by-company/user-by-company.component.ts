import { Component, OnInit,Input  } from '@angular/core';
import { User } from '../models/user';
import { WorldConferenceService } from '../services/world-conference.service';

@Component({
  selector: 'app-user-by-company',
  templateUrl: './user-by-company.component.html',
  styleUrls: ['./user-by-company.component.sass']
})
export class UserByCompanyComponent implements OnInit {
  @Input() item = ''; 
  @Input() UserName: any; 
  userList!: User[];
  displayedColumns: any =['name'];

  constructor(private worldConferenceService: WorldConferenceService) { }

  ngOnInit(): void {
    // TODO document why this method 'ngOnInit' is empty
    
    this.getUserByCompanyName(this.item);
    if(this.UserName!=null)
    {
      console.log(this.UserName);
    }
    
  
  }

  getUserByCompanyName(companyName: string){
    debugger;
    this.worldConferenceService.getAllUserByCompanyName(companyName).subscribe((data: any) => {       
      this.userList = data;
    })
  }
}
