class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to user_path(current_user)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end

  private
  def post_params
    params.require(:post).permit(:title, :explanation, :selling_price, :post_image_id, :condition, :is_burden)
  end
end
