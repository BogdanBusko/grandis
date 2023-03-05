class PostsController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.ordered)
  end

  def show
    @post = Post.find(params[:id])
  end
end
