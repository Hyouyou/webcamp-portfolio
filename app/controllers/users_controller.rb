class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
        redirect_to user_path(@user.id)
    else
      #render後にリロードするとエラーになるの修正必要
      render 'edit'
    end
  end

  def hide
  end

  def is_deleted
  end

  private
  def user_params
  	params.require(:user).permit(:name, :user_image)
  end
end
