var app = angular.module('Owly', ['restangular']);

app.config(['RestangularProvider', function(RestangularProvider) {
    
    RestangularProvider.setBaseUrl("http://owly.ru/api");
    //RestangularProvider.setRequestSuffix('.json');
    //RestangularProvider.setDefaultHttpFields({xsrfCookieName:'csrftoken', xsrfHeaderName:'X-CSRFToken'});
}]);

_.contains = _.includes

