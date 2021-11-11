class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.paginate(page: params[:page], per_page: 3)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.id.to_s != @post.uid.to_s and current_user.name.to_s != "admin"
      redirect_to @post, alert: "You can't edit this post."
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end


  def destroy
    @post = Post.find(params[:id])
    if (current_user.id.to_s == @post.uid.to_s) || (current_user.name.to_s == "admin")
      @post.destroy
      redirect_to posts_path
    else
      redirect_to @post, alert: "You can't delete this post."
    end
  end


  private
  def post_params
    params[:post].merge!(:uid => current_user.id.to_s)
    params.require(:post).permit(:title, :content, :image, :uid)
  end
end