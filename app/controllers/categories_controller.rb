class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:slug])
    @products = Product.where(category_id: @category.id).decorate
  end
end
