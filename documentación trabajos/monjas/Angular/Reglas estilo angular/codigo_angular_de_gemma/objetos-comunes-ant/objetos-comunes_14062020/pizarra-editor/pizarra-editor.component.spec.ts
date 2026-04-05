import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PizarraEditorComponent } from './pizarra-editor.component';

describe('PizarraEditorComponent', () => {
  let component: PizarraEditorComponent;
  let fixture: ComponentFixture<PizarraEditorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PizarraEditorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PizarraEditorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
