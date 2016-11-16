class PostsController < ApplicationController

  def index
    if !params[:cate].blank?
      @cate_id = Cate.find_by(name: params[:cate]).id
      @posts = @paginate = Post.includes(:cate).published.where(cate_id: @cate_id).order('id DESC').paginate(:page => params[:page])
    elsif params[:tag]
      @posts = @paginate = Post.includes(:tag).published.tagged_with(params[:tag]).order('id DESC').paginate(:page => params[:page])
    else
      @posts = @paginate = Post.includes(:cate).published.order('id DESC').paginate(:page => params[:page])
    end

  end

  def show
    @post = Post.friendly.find(params[:id])
    set_page_title @post.title
    set_page_description view_context.truncate(@post.body, :length => 100)
  end

end
