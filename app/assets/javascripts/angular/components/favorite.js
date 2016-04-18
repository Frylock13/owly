(function() {
  'use strict';

  angular
    .module('Owly')
    .factory('favoriteService', favoriteService);

  function favoriteService(Restangular) {
    var service = {
      switchFavorite    : switchFavorite,
      getFavoritesCount : getFavoritesCount 
    }

    var baseUrl = 'http://owly.ru/api'

    return service;
    
    function switchFavorite(favoriteId, productId) {
      return Restangular.oneUrl('favorite', baseUrl + '/favorites/add').customPUT({'favorite_id': favoriteId, product_id: productId});
    };

    function getFavoritesCount() {
      return Restangular.oneUrl('count', baseUrl + '/favorites/count/').get();
    }
  }
})();