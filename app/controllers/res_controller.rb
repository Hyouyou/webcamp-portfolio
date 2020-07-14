class ResController < ApplicationController
  def create
    @re = current_user.res.new(re_params)
    if @re.save
      flash[:notice] = "投稿が完了しました"
      redirect_to user_path(@re.user_id)
    else
      flash[:alert] = "投稿に失敗しました"
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private
  def re_params
    params.require(:re).permit(:title, :cycle, :content, :re_image)
  end
end
