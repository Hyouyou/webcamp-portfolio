class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "投稿が完了しました"
        redirect_to user_path(@post.user_id)
    else
      flash[:alert] = "投稿に失敗失敗しました"
      #render後にリロードするとエラーになるの修正必要
      render 'new'
    end
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
    if @post.update(post_params)
      flash[:success] = "投稿を更新しました"
        redirect_to post_path(@post.id)
    else
      flash[:alert] = "投稿の更新に失敗しました"
      #render後にリロードするとエラーになるの修正必要
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:danger] = "投稿を削除しました"
    redirect_to user_path(current_user)
  end

  def search
  end

  private
  def post_params
    params.require(:post).permit(:title, :explanation, :selling_price, :post_image, :condition, :is_burden)
  end
end
