class FavoritesController < ApplicationController
  
  def index
    @page = Page.find_by(slug: params[:controller])
    @products = favorite_products_list
  end

  def destroy
    FavoritesService.new(favorites_id, params[:id]).delete
    redirect_to :back
  end

  private

  def favorite_products_list
    FavoritesService.new(favorites_id).favorites_list
  end

end
