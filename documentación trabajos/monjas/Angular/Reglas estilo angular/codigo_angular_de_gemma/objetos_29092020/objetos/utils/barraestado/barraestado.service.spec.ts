import { TestBed, inject } from '@angular/core/testing';

import { BarraestadoService } from './barraestado.service';

describe('BarraestadoService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [BarraestadoService]
    });
  });

  it('should be created', inject([BarraestadoService], (service: BarraestadoService) => {
    expect(service).toBeTruthy();
  }));
});
