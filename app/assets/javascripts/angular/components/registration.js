(function() {
  'use strict';

  angular
    .module('Owly')
    .factory('registrationService', registrationService);

  function registrationService(Restangular) {
    var service = {
      checkUsername : checkUsername
    }

    var baseUrl = 'http://localhost:3000/api/'

    return service;
    ///////////////////
    
    function checkUsername(username) {
      return Restangular.oneUrl('users', baseUrl + 'users/' + username + '/check_username').get();
    };
  }
})();