class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string  :name
      t.string  :display_name
      t.integer :number_of_balls
      t.integer :lowest_number
      t.integer :highest_number
      t.integer :number_of_super_balls, :default => 0
      t.integer :lowest_super_number,   :default => 0
      t.integer :highest_super_number,  :default => 0
      t.boolean :sequenced,             :default => true
      t.boolean :duplicates,            :default => false
      t.boolean :regular_duplicates,    :default => false
      t.boolean :super_duplicates,      :default => false
      t.string  :url
      t.text    :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
