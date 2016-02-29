class FavoritesController < ApplicationController
  
  def index
    @page = Page.find_by(slug: params[:controller])
    @products = Product.where(id: favorite_products_list)
  end

  def destroy
  end

  private

  def favorite_products_list
    $redis.smembers("favorites_#{session[:guest_id]}")
  end

end
