class CommentsController < ApplicationController
  def create
  	post = Post.find(params[:post_id])
  	@comment = current_user.comments.new(comment_params)
  	@comment.post_id = post.id
  	if @comment.save
  	   redirect_to post_path(post.id)
    else
      @post = Post.find(params[:post_id])
      render template: 'posts/show'
    end

  end

  def destroy
  	comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
  	comment.destroy
  	redirect_to user_psth(current_user)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
