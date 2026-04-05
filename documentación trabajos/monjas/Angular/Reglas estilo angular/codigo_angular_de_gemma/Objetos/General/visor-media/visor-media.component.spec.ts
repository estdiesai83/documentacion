import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VisorMediaComponent } from './visor-media.component';

describe('VisorMediaComponent', () => {
  let component: VisorMediaComponent;
  let fixture: ComponentFixture<VisorMediaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VisorMediaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VisorMediaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
