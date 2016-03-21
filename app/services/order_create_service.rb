class OrderCreateService

  def initialize(params, guest_id)
    @params = params
    @guest_id = guest_id
    @order = Order.new(params)
  end

  def call
    @order.products = products_in_cart
    generate_invoice if legal_entity?
    clean_cart
    @order.save!
    send_mail_to_user(@order.id)
    send_mail_to_admin(@order.id)
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

  def generate_invoice
    @order.invoice_key = SecureRandom.hex
  end

  def send_mail_to_user(order_id)
    OrderMailer.order_created_to_user(order_id).deliver
  end

  def send_mail_to_admin(order_id)
    OrderMailer.order_created_to_admin(order_id).deliver
  end
end