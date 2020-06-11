class CommentsController < ApplicationController
  def create
  	post = Post.find(params[:id])
  	comment = current_user.comments.new(comment_params)
  	comment.post_id = post.id
  	comment.save
  	redirect_back(fallback_location: post_path)

  end

  def destroy
  	comment = Comment.find_by(id: params[:id], post_id: params[:past_id])
  	comment.destroy
  	redirect_to user_psth(current_user)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
end
