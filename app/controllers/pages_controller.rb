class PagesController < ApplicationController

  def home
    @categories = Category.limit(4)
    @products = Product.limit(3).order("RANDOM()").decorate
    @posts = Post.order('id DESC').limit(3).decorate
    @popular_products = Product.most_popular
  end

  def blog
    @page = Page.find_by(slug: params[:action])
    @posts = Post.all
  end

end
