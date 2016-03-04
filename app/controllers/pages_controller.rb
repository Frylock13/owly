class PagesController < ApplicationController

  before_action :set_page

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

  def how_to
  end

  def contacts
  end

  private

  def set_page
    @page = Page.find_by(slug: params[:action])
  end
end
