class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def upload_post
    post = Post.new(title: params[:title], 
                    username: params[:username], 
                    content: params[:content])
    post.save
    redirect_to "/home/index"
  end
  
  def comment
    comment = Comment.new(username: params[:username],
                          content: params[:content],
                          post_id: params[:post_id])
    comment.save
    redirect_to "/home/index"
  end
end
