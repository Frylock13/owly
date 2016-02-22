module CartsHelper

  def get_cart_count
    cart_count_name = CartCountService.new("cart_#{session[:guest_id]}").send(:parse_cart_count_name)
    cart_count = $redis.get cart_count_name
    cart_count ? cart_count : 0
  end
  
end