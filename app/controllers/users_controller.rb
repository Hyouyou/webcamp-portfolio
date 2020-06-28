class UsersController < ApplicationController
  before_action :authenticate_user!, except:[:show]
  
  def show
  	@user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
        flash[:notice] = "ユーザー情報を更新しました"
        redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "ユーザー情報の更新に失敗しました"
      render 'edit'
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :user_image, :profile)
  end
end
