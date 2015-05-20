'use strict'

@serviceModule.factory 'AuthService', ($state, Session) ->
  login: (email, password) ->
    Session.save(
      {
        email: email
        password: password      
      },

      (successResponse) =>        
        @saveUser(successResponse)
        $state.go 'home'        

      (errorResponse) ->
        console.log "Login failed"
    )

  saveUser: (userResponse) ->
    console.log "Do stuff with the user here"


