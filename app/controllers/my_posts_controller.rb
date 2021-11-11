class MyPostsController < ApplicationController
  before_action :authenticate_user!
  def all
    @posts = Post.where(:uid => current_user.id)
    @latest_my_post = @posts.first
    @my_other_posts =  @posts.paginate(:page => params[:page], :per_page => 3)
  end
end
