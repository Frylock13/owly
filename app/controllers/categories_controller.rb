class CategoriesController < ApplicationController

  def show
    @category = Category.friendly.find(params[:id])
    @products = ProductSearchService.call(sort: params[:sort], 
                                          page: params[:page], 
                                          category_id: @category.id)
    @viewed_products = RecentlyViewedList.call(session[:guest_id]).order('RANDOM()')

    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
  end
end
