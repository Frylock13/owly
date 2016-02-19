class PagesController < ApplicationController
  def home
    @categories = Category.limit(4)
    @products = Product.limit(3).order("RANDOM()")
    @posts = Post.order('id DESC').limit(3).decorate
  end
end
