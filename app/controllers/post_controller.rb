class PostController < ApplicationController
  before_action :login_check
  def index
    @posts = Post.all
  end
  
  def create
    p = Post.new
    p.article = params[:article]
    p.user = current_user
    p.total = params[:total]
    p.save
    redirect_to "/post/index"
  end
  
  def like
    l = Like.new
    l.user = current_user
    l.post_id = params[:post_id]
    l.save
    redirect_to "/post/index"
  end
  
  def unlike
    l = Like.where(:post_id => params[:post_id]).where(:user => current_user).take
    l.delete
    redirect_to "/post/index"
  end
  
  def join
    j = Join.new
    j.user = current_user
    j.post_id = params[:post_id]
    j.save
    redirect_to "/post/index"
  end

  def disjoin
    j = Join.where(:post_id => params[:post_id]).where(:user => current_user).take
    j.delete
    redirect_to "/post/index"
  end

  
end
