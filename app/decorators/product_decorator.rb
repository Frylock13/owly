class ProductDecorator < Draper::Decorator
  delegate_all

  def cart_status(cart, product)
    if $redis.hexists(cart, product)
      'Удалить из корзины'
    else
      'Добавить в корзину'
    end
  end
end
