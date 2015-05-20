'use strict'

@controllerModule.controller 'LoginCtrl', (AuthService) ->

  @login = =>
    console.log "in here"
    AuthService.login(@email, @password)

  return @