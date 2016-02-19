class ProductDecorator < Draper::Decorator
  delegate_all

  include Rails.application.routes.url_helpers

  def cart_status(cart_id, product_id)
    if $redis.hexists(cart_id, product_id)
      h.content_tag :p, 'Добавлено'
    else
      h.link_to 'Добавить в корзину', add_to_cart_path(product_id: object.id), method: :put
    end
  end
end
