class DeleteComments < ActiveRecord::Migration
  def self.up
    drop_table :comments
  end

  def self.down
    create_table :comments do |t|
      t.integer :user_id
      t.integer :blog_post_id
      t.text    :content
      t.boolean :approved

      t.timestamps
    end
  end
end
