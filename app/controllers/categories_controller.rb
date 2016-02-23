class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(slug: params[:slug])
    @products = ProductSorting.call(params[:sort], @category.id)
    @viewed_products = RecentlyViewedList.call(session[:guest_id])
  end

end
