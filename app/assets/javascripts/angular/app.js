var app = angular.module('Owly', ['restangular'])
  .config(function (RestangularProvider) {
    
    RestangularProvider.setBaseUrl("http://37.143.11.71/api");
    //RestangularProvider.setRequestSuffix('.json');
    //RestangularProvider.setDefaultHttpFields({xsrfCookieName:'csrftoken', xsrfHeaderName:'X-CSRFToken'});
});

_.contains = _.includes