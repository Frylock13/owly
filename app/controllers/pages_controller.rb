class PagesController < ApplicationController

  before_action :set_page, only: [:blog, :our_products, :about, :favorites]

  def home
    @categories = Category.all
    @posts = Post.order('id DESC').limit(3).decorate
    @popular_products = Product.most_popular
  end

  def blog
    @posts = Post.all
  end

  def our_products
    @categories = Category.all
    @popular_products = Product.most_popular
  end

  def about
  end

  def favorites
    @products = Product.all.limit(3)
  end

  private

  def set_page
    @page = Page.find_by(slug: params[:action])
  end
end
