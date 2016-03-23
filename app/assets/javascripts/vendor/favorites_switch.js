$('.favorite img').click(function() {
  if($(this).hasClass("active")) {
    $(this).attr("src", "#{asset_path 'home/favorite.png'}");
  } else {
    $(this).attr("src", "#{asset_path 'active-favorite.png'}");
  }

  $(this).toggleClass('active');
});