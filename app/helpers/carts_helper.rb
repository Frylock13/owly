module CartsHelper

  def get_cart_count
    cart_count_name = CartCountService.new("cart_#{session[:guest_id]}").send(:parse_cart_count_name)
    cart_count = $redis.get cart_count_name
    cart_count ? cart_count : 0
  end
  
  def get_total_amount(products)
    total_amount = 0
    
    products.map do |product|
      result = product.price * product.count.to_i
      total_amount += result
    end

    total_amount
  end

end