app.controller('RegistrationCtrl', RegistrationCtrl)

function RegistrationCtrl(registrationService) {
  var vm = this;

  vm.checkUsername = function(username) {
    registrationService.checkUsername(username).then(function(res) {
      vm.status = res.status;
    });
  }
}
