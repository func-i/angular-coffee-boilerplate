(function() {
  module.exports.httpMock = function() {
    var flipGiveApp, mockUser;
    mockUser = arguments[0] || {};
    flipGiveApp = angular.module('flipGiveApp');
    return flipGiveApp.run(function($httpBackend, sessionsPath) {
      var createSession;
      createSession = function() {
        return {
          user: mockUser,
          auth_token: 'abc123_token',
          session_id: 'abc123_session'
        };
      };
      $httpBackend.whenGET(/^views\//).passThrough();
      return $httpBackend.whenPOST(sessionsPath).respond(function(method, url, data) {
        var cred, err, session;
        cred = angular.fromJson(data);
        if (cred.login === 'bad@bad.com') {
          err = {
            error: "Wrong login credentials"
          };
          return [401, err, {}];
        } else {
          session = createSession();
          return [200, session, {}];
        }
      });
    });
  };

}).call(this);

//# sourceMappingURL=http_mock.js.map
