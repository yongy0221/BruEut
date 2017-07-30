class SearchController < ApplicationController
    def index
        term = params[:term].strip
        term = term.gsub("  ", " ").gsub(" ", "%")
        search_title = Post.where("title LIKE ?", "%#{term}%")
        search_username = Post.where("username LIKE ?" , "%#{term}%")
        search_content = Post.where("content LIKE ?" , "%#{term}%")

        search_comment_username = Comment.where("username LIKE ?" , "%#{term}%")
        search_comment_text = Comment.where("content LIKE ?" , "%#{term}%")



        @posts = search_content + search_title + search_username
        @posts = @posts.uniq

        @comments = search_comment_username + search_comment_text
        @comments = @comments.uniq


        @posts = @posts.flatten
        @comments = @comments.flatten



    end
end
