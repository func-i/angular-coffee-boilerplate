'use strict'

@controllerModule.controller 'HomeCtrl', (Product) ->

  Product.query().$promise.then (products) =>
    @products = products.data

  return @