BASE_URL = 'http://localhost:9001/';

exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',

  capabilities: {
    'browserName': 'chrome'
  },

  framework: 'jasmine2',
  
  // specs: ['e2e/home.js'],

  suites: {
    // login:  'e2e/login.js',
    socket: [
      'e2e/login_page_test.js'
    ]  
  },

  jasmineNodeOpts: {
    // Show output in color
    showColors: true,
    // // Default time to wait in ms before a test fails.
    // defaultTimeoutInterval: 30000,
    // // Function called to print jasmine results.
    // print: function() {},
    // // If set, only execute specs whose names match the pattern, which is
    // // internally compiled to a RegExp.
    // grep: 'pattern',
    // // Inverts 'grep' matches
    // invertGrep: false
  },

  onPrepare: function() {
    // http://stackoverflow.com/questions/24098434/protractor-tests-in-coffeescript-producing-syntaxerror-unexpected-by
    // global.By = global.by;

    // add ngMockE2E module for http mock below
    browser.addMockModule('flipGiveApp.testMockE2E', function () {
      testModule = angular.module('flipGiveApp.testMockE2E', ['ngMockE2E']);
    });

    // http mock
    httpMockModule = require("./mock/http_mock.js");   
    browser.addMockModule('flipGiveApp', httpMockModule.httpMock);    

    global.login = function() {
      browser.get(BASE_URL + '#/login');       
      element(by.css('input[type="email"]')).sendKeys('test@test.com');
      element(by.css('input[type="password"]')).sendKeys('test');
      element(by.css('input[type="submit"]')).click();
    }

    global.logout = function() {
      // browser.manage().deleteAllCookies();
      browser.executeScript('window.localStorage.clear();');
    }
   
    /**
    * @name waitForUrlToChangeTo
    * @description Wait until the URL changes to match a provided regex
    * @param {RegExp} urlRegex wait until the URL changes to match this regex
    * @returns {!webdriver.promise.Promise} Promise
    */
    global.waitForUrlToChangeTo = function(urlRegex) {
      var currentUrl;

      return browser.getCurrentUrl().then(function storeCurrentUrl(url) {
        currentUrl = url;
      }).then(function waitForUrlToChangeTo() {
        return browser.wait(function waitForUrlToChangeTo() {
          return browser.getCurrentUrl().then(function compareCurrentUrl(url) {
            return urlRegex.test(url);
          });
        });
      });
    }
  }
}