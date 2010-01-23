class CommentsController < ApplicationController
  def create
    c = Comment.new(params[:comment])
    c.blog_post_id = params[:blog_post][:id]
    c.user_id = params[:user][:id] unless params[:user].blank?
  
    if c.save
      redirect_to blog_post_path(params[:blog_post][:id])
    end
  end
end
