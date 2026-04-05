import { PostitModule } from './postit.module';

describe('PostitModule', () => {
  let postitModule: PostitModule;

  beforeEach(() => {
    postitModule = new PostitModule();
  });

  it('should create an instance', () => {
    expect(postitModule).toBeTruthy();
  });
});
