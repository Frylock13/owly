app.controller('HomeCtrl', HomeCtrl)

function HomeCtrl(cartService) {
  var vm = this;

  vm.getCartCount = function() {
    cartService.getCartCount().then(function(res) {
      vm.cartCount = res;
    });
  }

  vm.getCartCount();

  vm.addToCart = function(cartId, productId) {
    cartService.addToCart(cartId, productId);
    vm.getCartCount();
  }
}