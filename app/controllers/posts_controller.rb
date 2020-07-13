class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit]

  def new
    @post = Post.new
    @re = Re.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "投稿が完了しました"
        redirect_to user_path(@post.user_id)
    else
      flash.now[:alert] = "投稿に失敗しました"
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.page(params[:page]).reverse_order
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を更新しました"
        redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "投稿の更新に失敗しました"
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "投稿を削除しました"
    redirect_to user_path(current_user)
  end

  def search
  end

  private
  def post_params
    params.require(:post).permit(:title, :explanation, :selling_price, :post_image, :condition, :is_burden)
  end

  def re_params
    params.require(:re).permit(:title, :value, :content)
  end
end
