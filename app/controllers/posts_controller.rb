class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id]).decorate
    @previous_post = Post.where('id < ?', @post.id).take
    @next_post = Post.where('id > ?', @post.id).take
  end

end