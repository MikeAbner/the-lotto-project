class BlogPostsController < ApplicationController
  def index
  end
  def show
    @post = BlogPost.find(params[:id])
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
    
    @post.pub_date = DateTime.now
    
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
    
    @post.pub_date = DateTime.now
    
    if @post.update_attributes(params[:blog_post])
      flash[:success] = "Blog Post saved successfully"
      redirect_to blog_post_path(@post.id)
    else
      flash[:error] = "Could not save the blog post"
      render :action => 'edit'
    end  
  end
  def destroy
  end
end
