class PostsController < ApplicationController

  def index
    @posts = @paginate = Post.order('id DESC').paginate(:page => params[:page])
  end

  def show
    @post = Post.find(params[:id])
    set_page_title @post.title
  end

end
