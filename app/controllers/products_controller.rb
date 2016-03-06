class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id]).decorate
    @additional_images = @product.images
    @reviews = @product.reviews.decorate
    @related_products = Product.where(id: related_product_ids)

    # Update viewed list(set) in redis
    update_recently_viewed_list
  end

  private

  def update_recently_viewed_list
    RecentlyViewedUpdate.call(session[:guest_id], params[:id])
  end

  def related_product_ids
    @product.related.delete(' ').split(',')
  end
end
