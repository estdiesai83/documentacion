import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CalendarioAniosComponent } from './calendario-anios.component';

describe('CalendarioAniosComponent', () => {
  let component: CalendarioAniosComponent;
  let fixture: ComponentFixture<CalendarioAniosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CalendarioAniosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CalendarioAniosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
