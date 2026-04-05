import { Btn1TextoModule } from './btn1-texto.module';

describe('Btn1TextoModule', () => {
  let btn1TextoModule: Btn1TextoModule;

  beforeEach(() => {
    btn1TextoModule = new Btn1TextoModule();
  });

  it('should create an instance', () => {
    expect(btn1TextoModule).toBeTruthy();
  });
});
