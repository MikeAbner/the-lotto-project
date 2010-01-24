class BlogController < ApplicationController
  before_filter :authenticate_user!
  def index
    @posts = BlogPost.published_posts

    if !current_user.nil?
      if current_user.admin
        @posts = BlogPost.all
      end
    end
  end
end
