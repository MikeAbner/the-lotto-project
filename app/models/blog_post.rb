class BlogPost < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  def self.published_posts
    find(:all, 
          :limit => 5, 
          :conditions => {:status => 200},
          :order => "pub_date desc")
  end
end
