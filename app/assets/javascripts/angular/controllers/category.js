app.controller('CategoryCtrl', ['categoryService', function(categoryService) {

  function CategoryCtrl() {
    var vm = this;

    vm.getProducts = function() {
      categoryService.getProducts().then(function(res) {
        vm.products = nilGuard(res);
        console.log(vm.products);
      });
    }


    //////////////////////////////////
    vm.getProducts();
    //////////////////////////////////
  }
}]);