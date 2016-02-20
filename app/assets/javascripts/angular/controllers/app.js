app.controller('AppCtrl', AppCtrl)

function AppCtrl(cartService, favoriteService) {
  var vm = this;

  vm.getCartCount = function() {
    cartService.getCartCount().then(function(res) {
      vm.cartCount = nilGuard(res);
    });
  }

  vm.getFavoritesCount = function() {
    favoriteService.getFavoritesCount().then(function(res) {
      vm.favoritesCount = nilGuard(res);
    });
  }

  //////////////////////////////////
  vm.getCartCount();
  vm.getFavoritesCount();
  //////////////////////////////////

  vm.addToCart = function(cartId, productId) {
    cartService.addToCart(cartId, productId);
    vm.getCartCount();
  }


  vm.switchFavorite = function(favoriteId, productId) {
    favoriteService.switchFavorite(favoriteId, productId);
    vm.getFavoritesCount();
  }

}