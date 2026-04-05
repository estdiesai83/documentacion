import { ClaveModule } from './clave.module';

describe('ClaveModule', () => {
  let claveModule: ClaveModule;

  beforeEach(() => {
    claveModule = new ClaveModule();
  });

  it('should create an instance', () => {
    expect(claveModule).toBeTruthy();
  });
});
