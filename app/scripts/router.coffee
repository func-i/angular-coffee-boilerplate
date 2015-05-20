'use strict'

@flipGiveApp.config ($urlRouterProvider, $stateProvider, $compileProvider, $httpProvider) ->
  
  $httpProvider.interceptors.push 'authenticatedInterceptor', 'unauthenticatedInterceptor'

  $urlRouterProvider.otherwise('/')
  $stateProvider
    .state "home",
      url: "/home"
      templateUrl: "views/home.html"
      controller: "HomeCtrl as homeCtrl"

    .state "login",
      url: "/login"
      templateUrl: "views/login.html"
      controller: "LoginCtrl as loginCtrl"

