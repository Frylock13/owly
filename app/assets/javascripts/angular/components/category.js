(function() {
  'use strict';

  angular
    .module('Owly')
    .factory('categoryService', categoryService);

  function categoryService(Restangular) {
    var service = {
      getProducts : getProducts
    }

    var baseUrl = 'http://localhost:3000/api'

    return service;
    
    function getProducts(categoryName) {
      return Restangular.one('categories', categoryName);
    }
  }
})();