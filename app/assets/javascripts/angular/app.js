var app = angular.module('Owly', ['restangular'])
  .config(function (RestangularProvider) {
    
    RestangularProvider.setBaseUrl("http://localhost:3000/api");
    //RestangularProvider.setRequestSuffix('.json');
    //RestangularProvider.setDefaultHttpFields({xsrfCookieName:'csrftoken', xsrfHeaderName:'X-CSRFToken'});
});

_.contains = _.includes