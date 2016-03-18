class OrderCreateService

  def initialize(params, guest_id)
    @params = params
    @guest_id = guest_id
    @order = Order.new(params)
  end

  def call
    @order.products = products_in_cart
    create_invoice if legal_entity?
    clean_cart
    @order.save!
  end

  private

  def cart_id
    "cart_#{@guest_id}"
  end

  def products_in_cart
    $redis.hgetall cart_id
  end

  def clean_cart
    CartProductsService.new(cart_id).clean
  end

  def legal_entity?
    @params[:company_name] && @params[:inn]
  end

  def create_invoice
    @order.invoice_key = SecureRandom.hex
  end
end