class PagesController < ApplicationController

  before_action :set_page

  def home
    @categories = Category.only_parents
    @posts = Post.order('id DESC').limit(3).decorate
    @popular_products = Product.most_popular
    @images = Dir.glob("app/assets/images/slider/*.jpg")
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

  def search
  end

  private

  def set_page
    @page = Page.find_by(slug: params[:action])
  end
end
