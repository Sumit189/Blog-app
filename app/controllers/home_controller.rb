class HomeController < ApplicationController
  def index
    @other_posts = Post.order(:id).reverse_order.all.paginate(:page => params[:page], :per_page => 3)
    @latest_post = Post.last
  end
end
