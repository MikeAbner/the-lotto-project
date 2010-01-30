class GamesStates < ActiveRecord::Migration
  def self.up
    create_table :games_states, :id => false do |t|
      t.integer :game_id
      t.integer :state_id
    end
  end

  def self.down
    drop_table :games_states
  end
end
