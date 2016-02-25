class ProductDecorator < Draper::Decorator
  delegate_all

  def favorite_status(favorite_id)
    if $redis.sismember favorite_id, object.id
      h.image_tag 'active-favorite.png', class: 'active', id: 'to-favorite'
    else
      h.image_tag 'home/favorite.png', id: 'to-favorite'
    end
  end
end
