app.controller('CartCtrl', CartCtrl)

function CartCtrl() {
  var vm = this;

  vm.deliveryTab = 1;
  vm.paymentTab = 1;
  vm.orderBlock = 'close';

  vm.deliveryTabSet = function(value) {
    vm.deliveryTab = value;
  }

  vm.paymentTabSet = function(value) {
    vm.paymentTab = value;
  }

  vm.orderBlockSet = function(value) {
    vm.orderBlock = value;
    console.log(vm.orderBlock)
  }
}