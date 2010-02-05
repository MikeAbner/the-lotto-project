class DeleteBlogPosts < ActiveRecord::Migration
  def self.up
    drop_table :blog_posts
  end

  def self.down
    create_table :blog_posts do |t|
      t.integer     :user_id
      t.datetime    :pub_date
      t.integer     :status
      t.string      :title
      t.text        :content
      t.timestamps
    end
  end
end
