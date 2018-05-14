describe('Console', function () {
  const BASE_URL = process.env.BASE_URL;
  const QA_USERNAME = process.env.QA_USERNAME;
  const QA_PASSWORD = process.env.QA_PASSWORD;

  it('should login successfully', function () {
    browser.get(BASE_URL + '/login');
    const email = element(by.name('email'));
    const password = element(by.name('password'));
    const button = element(by.css('[type=submit]'));

    email.sendKeys(QA_USERNAME);
    password.sendKeys(QA_PASSWORD);
    button.click();
    browser.sleep(1000);

    const title = element(by.id('page-title'));
    expect(title.getText()).toEqual('Dashboard');
  });
});

