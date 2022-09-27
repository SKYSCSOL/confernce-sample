import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserByCompanyComponent } from './user-by-company.component';

describe('UserByCompanyComponent', () => {
  let component: UserByCompanyComponent;
  let fixture: ComponentFixture<UserByCompanyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserByCompanyComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserByCompanyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
