class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def index
  end
  def show
    @post = BlogPost.find(params[:id])    
    @comments = @post.comments
  end
  def create
    c = Comment.new(params[:comment])
    c.blog_post_id = params[:blog_post][:id]
    c.user = current_user unless current_user.nil?
  
    if !current_user.nil?
      if current_user.admin
        c.approved = true
      end
    end
  
    if c.save
      redirect_to blog_post_path(params[:blog_post][:id])
    else
      redirect_to blog_post_path(params[:blog_post][:id])
    end
  end
  
  def update
    c = Comment.find(params[:id])
    
    if params[:commit] == 'Approve'
      params[:comment][:approved] = true
    else
      params[:comment][:approved] = false
    end
    
    if c.update_attributes(params[:comment])
      redirect_to comment_path(c.blog_post_id)
    else
      render :action => "show"
    end
  end
  def destroy
    c = Comment.find(params[:id])
    c.destroy
    
    redirect_to comment_path(c.blog_post_id)
  end
end
