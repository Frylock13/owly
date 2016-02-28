class CreateOrder

  def initialize(params, guest_id)
    @params = params
    @guest_id = guest_id
  end

  def create
    order = Order.new(@params)
    order.save!

    clean_cart
  end

  private

  def cart_id
    "cart_#{@guest_id}"
  end

  def clean_cart
    CartProductsService.new(cart_id).clean
  end

end