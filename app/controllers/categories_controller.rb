class CategoriesController < ApplicationController

  def show
    @category = Category.friendly.find(params[:id])
    @products = ProductSorting.call(params[:sort], @category.id)
    @viewed_products = RecentlyViewedList.call(session[:guest_id]).order('RANDOM()')
  end
end
