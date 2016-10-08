class PostsController < ApplicationController

  def index
    @posts = @paginate = Post.paginate(:page => params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

end
