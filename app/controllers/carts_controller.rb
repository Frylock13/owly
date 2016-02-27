class CartsController < ApplicationController

  def show
    @page = Page.find_by(slug: params[:controller])
    @products = CartProductsService.new(cart_id).products
    #byebug
  end

  def increment
    CartProductsService.new(cart_id).increment(params[:product_id])
    redirect_to :back
  end

  def decrement
    CartProductsService.new(cart_id).decrement(params[:product_id])
    redirect_to :back
  end

  private

  def cart_id
    "cart_#{session[:guest_id]}"
  end
  
end
