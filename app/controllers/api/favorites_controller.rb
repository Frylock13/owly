class Api::FavoritesController < ApplicationController

  def add
    if FavoritesService.new(params[:favorite_id], params[:product_id]).switch
      render nothing: true,status: 200
    else
      render nothing: true, status: 404
    end
  end

  def count
    render text: favorites_count, status: 200
  end

  private

  def favorites_count
    $redis.scard favorites_id
  end

end