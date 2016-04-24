app.controller('CategoryCtrl', ['categoryService', function(categoryService) {

  var vm = this;

  vm.getProducts = function() {
    categoryService.getProducts('cat_0').then(function(res) {
      vm.products = nilGuard(res);
      console.log(res);
      console.log('qweu')
    });
  }

  vm.l = 'asd';

  vm.getProducts();
}]);