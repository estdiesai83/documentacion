import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { QuienComponent } from './quien.component';

describe('QuienComponent', () => {
  let component: QuienComponent;
  let fixture: ComponentFixture<QuienComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ QuienComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(QuienComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
