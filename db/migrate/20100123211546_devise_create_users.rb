class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.authenticatable :encryptor => :sha1, :null => false
      t.rememberable
      t.trackable
      t.validatable
      t.timeoutable

      t.string :nickname
      t.boolean :admin
      
      t.timestamps
    end

    add_index :users, :email,                :unique => true
  end

  def self.down
    drop_table :users
  end
end
