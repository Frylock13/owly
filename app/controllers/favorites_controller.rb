class FavoritesController < ApplicationController
  
  def index
    @page = Page.find_by(slug: params[:controller])
    @products = favorite_products_list
  end

  def destroy

  end

  private

  def favorite_products_list
    FavoritesService.new(favorites_id).favorites_list
  end

  def favorites_id
    "favorites_#{session[:guest_id]}"
  end

end
