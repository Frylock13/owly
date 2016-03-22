(function() {
  'use strict';

  angular
    .module('Owly')
    .factory('cartService', cartService);

  function cartService(Restangular) {
    var service = {
      addToCart    : addToCart,
      getCartCount : getCartCount 
    }

    var baseUrl = 'http://37.143.11.71/api'

    return service;
    ///////////////////
    
    function addToCart(cartId, productId) {
      return Restangular.oneUrl('cart', baseUrl + '/cart/add/').customPUT({'cart_id': cartId, product_id: productId});
    };

    function getCartCount() {
      return Restangular.oneUrl('count', baseUrl + '/cart/count/').get();
    }
  }
})();