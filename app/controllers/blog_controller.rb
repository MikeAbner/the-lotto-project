class BlogController < ApplicationController
  def index
    @posts = BlogPost.find(:all, 
                            :limit => 5, 
                            :conditions => {:status => "200"},
                            :order => "pub_date desc")
  end
end
