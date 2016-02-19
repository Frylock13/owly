app.controller('HomeCtrl', HomeCtrl)

function HomeCtrl() {
  var vm = this;

  vm.test = 1;
  
  vm.setStep = function(step) {
    vm.step = step;
  }
}