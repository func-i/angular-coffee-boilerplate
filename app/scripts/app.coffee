"use strict"

@flipGiveApp = angular.module "flipGiveApp", [
  'ngAnimate',
  'ngCookies',
  'ngResource',
  'ngRoute',
  'ngSanitize',
  'ngTouch',
  'ui.router',

  'flipGiveApp.controllers',
  'flipGiveApp.directives',
  'flipGiveApp.filters',
  'flipGiveApp.resources',
  'flipGiveApp.services',
  'flipGiveApp.interceptors',

  'CONFIG.{env}',  
]

@controllerModule  = angular.module 'flipGiveApp.controllers', []
@directiveModule   = angular.module 'flipGiveApp.directives', []
@filterModule      = angular.module 'flipGiveApp.filters', []
@resourceModule    = angular.module 'flipGiveApp.resources', []
@serviceModule     = angular.module 'flipGiveApp.services', []
@configModule      = angular.module 'flipGiveApp.config', []
@interceptorModule = angular.module 'flipGiveApp.interceptors', []

@flipGiveApp.run ($rootScope, $state) ->
  # Do other stuff here as needed
  console.log "App started"
