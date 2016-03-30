class PagesController < ApplicationController

  before_action :set_page

  def home
    @posts = Post.order('id DESC').limit(3).decorate
    @popular_products = Product.most_popular
    @images = Slider.enable
  end

  def blog
    @posts = Post.page(params[:page]).order('id')
    @posts = Post.where("tags LIKE ?", "%#{params[:tag]}%").page(params[:page]) if params[:tag]
    @tags = Setting.blog_tags.delete(' ').split(',').uniq
  end

  def our_products
    @popular_products = Product.most_popular
  end

  def about
  end

  def how_to
  end

  def contacts
  end

  def search
    if params[:query]
      @products   =   SearchService.call(model: 'Product', field: 'name', query: params[:query])
      @categories =   SearchService.call(model: 'Category', field: 'name', query: params[:query])
      @posts      =   SearchService.call(model: 'Post', field: 'title', query: params[:query])
    end
  end

  def robots                                                                                                                                      
    robots = File.read(Rails.root + "config/robots.#{Rails.env}.txt")
    render text: robots, layout: false, content_type: "text/plain"
  end

  private

  def set_page
    @page = Page.find_by(slug: params[:action])
  end
end
