$(document).ready(function() {
  $(".add-to-cart").click(function() {
    $(this).find('a').text('Добавлено');

    window.setInterval(function() {
      $(this).find('a').text('Добавить в корзину');
    }, 2000);    
  })
})