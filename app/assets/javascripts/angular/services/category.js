(function() {
  'use strict';

  angular
    .module('Owly')
    .factory('categoryService', categoryService);

  function categoryService(Restangular) {
    var service = {
      getProducts       : getSortedProducts, 
      getSortedProducts : getProducts
    }

    var baseUrl = 'http://owly.ru/api'

    return service;
    
    function getProducts(categoryName) {
      return Restangular.oneUrl('category', baseUrl + '/categories/' + categoryName).get();
    }

    function getSortedProducts(categoryName, type='oldest') {
      return Restangular.oneUrl('category', baseUrl + '/categories/' + categoryName + '?sort=' + type).get();
    }
  }
})();