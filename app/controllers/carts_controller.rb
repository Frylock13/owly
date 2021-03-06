class CartsController < ApplicationController

  def show
    @page = Page.find_by(slug: params[:controller])
    @products = GetProductsList.call(products_hash)
  end

  def increment
    CartProductsService.new(cart_id, params[:product_id]).increment
    redirect_to :back
  end

  def decrement
    CartProductsService.new(cart_id, params[:product_id]).decrement
    redirect_to :back
  end

  def set_count
    if params[:count].to_i > 0
      CartProductsService.new(cart_id, params[:product_id]).set_count(params[:count])
      redirect_to :back
    else
      redirect_to :back
      flash[:danger] = 'Вы ввели отрицательное число'
    end
  end

  def delete
    CartProductsService.new(cart_id, params[:product_id]).delete
    redirect_to :back
  end

  private

  def products_hash
    $redis.hgetall cart_id
  end
end
