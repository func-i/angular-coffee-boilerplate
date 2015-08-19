# API host address changed on 'grunt build' by setting variable 'ENV'
# e.g. 'ENV=staging grunt deploy'
# Defaults to 'development' if not defined

angular.module('CONFIG.development', []).constant 'CONFIG',
  
  api:
    host: "http://localhost:3000"

angular.module('CONFIG.staging', []).constant 'CONFIG',
  
  api:
    host: "https://staging.angularcoffeeapp.com"
  
angular.module('CONFIG.production', []).constant 'CONFIG',
  
  api:
    host: "https://api.angularcoffeeapp.com"