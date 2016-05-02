app.controller('AppCtrl', ['cartService', 'favoriteService', function(cartService, favoriteService) {
  var vm = this;

  vm.reviewTab = 1;

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

  vm.getReviewForm = function() {
    vm.reviewTab = 2;
  }

  //////////////////////////////////
  vm.getCartCount();
  vm.getFavoritesCount();
  //////////////////////////////////

  vm.addToCart = function(cartId, productId) {
    cartService.addToCart(cartId, productId);
    vm.cartCount += 1;
  }

  vm.switchFavorite = function(favoriteId, productId) {
    favoriteService.switchFavorite(favoriteId, productId);
    setTimeout(vm.getFavoritesCount, 200)
  }
}]);
