class PagesController < ApplicationController
  def home
    @categories = Category.limit(4)
    @products = Product.limit(3)
    @posts = Post.limit(3).decorate
  end
end
