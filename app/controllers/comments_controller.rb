class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        if @post.receive_comment_notification and @post.id != current_user.id
          CommentMailer.comment_notification(@comment).deliver_now
        end
        format.html { redirect_to @post, notice: 'Comment Posted.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to @post, alert: 'Please write something in comment...' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_url(@post), notice: 'Comment Deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def comment_params
    params[:comment].merge!(:user_name => current_user.name, :uid => current_user.id.to_s)
    params.require(:comment).permit(:user_name, :comment, :uid)
  end
end
