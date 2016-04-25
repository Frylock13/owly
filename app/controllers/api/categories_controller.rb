class Api::CategoriesController < ApplicationController

  def show
    @category = Category.friendly.find(params[:id])
    @products = ProductSearchService.call(sort: params[:sort], 
                                          page: params[:page], 
                                          category_id: @category.id)
    
    render json: @products.to_json(only: [:name, :id, :rating, :price], methods: [:image_url, :rating_image])
  end
end