class BlogPost < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  def self.published_posts
    find(:all, 
          :limit => 5, 
          :conditions => {:status => 200},
          :order => "pub_date desc")
  end
  
  def self.unapproved_comments
    count = 0
    Comment.all.each do |c|
      count += 1 if c.approved != true
    end
    count
  end
  
  def unapproved_comments
    count = 0
    comments.each do |c|
      count += 1 if c.approved != true
    end
    count
  end
end
