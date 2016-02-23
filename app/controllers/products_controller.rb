class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])

    # Update viewed list(set) in redis
    RecentlyViewedUpdate.call(session[:guest_id], params[:id])
  end

end
