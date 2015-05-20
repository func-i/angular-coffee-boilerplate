'use strict'

@serviceModule.factory 'sessionsPath', (CONFIG) ->
  "#{CONFIG.api.host}/sessions"

@resourceModule.factory 'Session', ($resource, sessionsPath) ->
  $resource sessionsPath, {}