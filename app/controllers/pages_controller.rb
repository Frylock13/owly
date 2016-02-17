class PagesController < ApplicationController
  def home
    @categories = Category.limit(4)
    @products = Product.limit(3)
  end
end
