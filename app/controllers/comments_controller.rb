class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params[:comment].merge!(:user_name => current_user.name, :uid => current_user.id.to_s)
    params.require(:comment).permit(:user_name, :comment, :uid)
  end
end
