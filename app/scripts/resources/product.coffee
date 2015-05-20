'use strict'

@serviceModule.factory 'productsPath', (CONFIG) ->
  "#{CONFIG.api.host}/products"

@resourceModule.factory 'Product', ($resource, productsPath) ->
  $resource productsPath, {}