class CommentMailer < ApplicationMailer
  def comment_notification(comment)
    @comment = comment
    @post = @comment.post
    @user = User.find(@post.uid)
    mail(to: @user.email, subject: 'New comment on your post')
  end
end
