(function() {
  'use strict';
  var LoginPage;

  LoginPage = function() {
    this.get = function() {
      return browser.get(BASE_URL + "#/login");
    };
    return this;
  };

  describe('Login Page', function() {
    var loginP;
    loginP = new LoginPage();
    it('should resolve to the login page', function() {
      loginP.get();
      return expect(browser.getLocationAbsUrl()).toBe('/login');
    });
    return it('should allow for a login and redirect to home page', function() {
      login();
      return expect(browser.getLocationAbsUrl()).toBe('/home');
    });
  });

}).call(this);

//# sourceMappingURL=login_page_test.js.map
