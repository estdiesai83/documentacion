import { PizarraModule } from './pizarra.module';

describe('PizarraModule', () => {
  let pizarraModule: PizarraModule;

  beforeEach(() => {
    pizarraModule = new PizarraModule();
  });

  it('should create an instance', () => {
    expect(pizarraModule).toBeTruthy();
  });
});
