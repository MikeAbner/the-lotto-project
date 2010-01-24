class BlogPostsController < ApplicationController
  before_filter :authenticate_user!
  def index
  end
  def show
    @post = BlogPost.find(params[:id])
    @comment = Comment.new
  end
  def new
    @post = BlogPost.new
    render :action => 'edit'
  end
  def edit
    @post = BlogPost.find(params[:id])
  end
  def create
    @post = BlogPost.new(params[:blog_post])
  
    @post.user = current_user  
    
    if params[:commit] == "Publish"
      @post.pub_date = DateTime.now
      @post.status = 200
    else
      @post.status = 100
    end
    
    if @post.save
      flash[:success] = "Blog Post saved successfully"
      redirect_to blog_post_path(@post.id)
    else
      flash[:error] = "Could not save the blog post"
      render :action => 'edit'
    end
  end
  def update
    @post = BlogPost.find(params[:id])
  
    if params[:commit] == "Publish"
      @post.pub_date = DateTime.now
      @post.status = 200
    else
      @post.status = 100
    end
    
    if @post.update_attributes(params[:blog_post])
      flash[:success] = "Blog Post saved successfully"
      redirect_to blog_post_path(@post.id)
    else
      flash[:error] = "Could not save the blog post"
      render :action => 'edit'
    end  
  end
  def destroy
    @post = BlogPost.find(params[:id])
    @post.destroy
    
    redirect_to '/blog'
  end
end
