class User < ActiveRecord::Base
  # Include default devise modules.
  # Others available are :lockable, :timeoutable and :activatable.
  devise :authenticatable, :rememberable, :trackable, :validatable, :timeoutable

  has_many :blog_posts
  has_many :comments

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :admin, :nickname
end
