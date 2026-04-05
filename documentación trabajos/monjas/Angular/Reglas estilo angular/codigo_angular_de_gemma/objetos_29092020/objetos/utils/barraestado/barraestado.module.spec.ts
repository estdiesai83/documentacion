import { BarraestadoModule } from './barraestado.module';

describe('BarraestadoModule', () => {
  let barraestadoModule: BarraestadoModule;

  beforeEach(() => {
    barraestadoModule = new BarraestadoModule();
  });

  it('should create an instance', () => {
    expect(barraestadoModule).toBeTruthy();
  });
});
