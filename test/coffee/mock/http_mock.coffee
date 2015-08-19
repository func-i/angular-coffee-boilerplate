module.exports.httpMock = ->
  
  mockUser  = arguments[0] or {}

  angularCoffeeApp = angular.module 'angularCoffeeApp'

  angularCoffeeApp.run ($httpBackend, sessionsPath) ->
  
    createSession = () ->
      user        : mockUser
      auth_token  : 'abc123_token'
      session_id  : 'abc123_session'


    $httpBackend.whenGET /^views\// 
      .passThrough()

    $httpBackend.whenPOST sessionsPath
      .respond (method, url, data) ->

        cred = angular.fromJson data

        if cred.login == 'bad@bad.com'
          err = 
            error : "Wrong login credentials"
          return [401, err, {}]
        else
          session = createSession()
          return [200, session, {}]    