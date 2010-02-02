class Game < ActiveRecord::Base
  has_and_belongs_to_many :states
  
  attr_reader :generator
  
  def after_initialize
    return if !self.id
    create_constant
    init_generator
  end

  def after_save
    Rails.cache.write("Game/#{id}", self) if RAILS_ENV != 'development'
    Rails.cache.delete('Game.all')
    Rails.cache.delete('State.all')
    State.invalidate_cache
  end
  
  def after_update
    Rails.cache.write("Game/#{id}", self) if RAILS_ENV != 'development'
    Rails.cache.delete('Game.all')
    Rails.cache.delete('State.all')
    State.invalidate_cache
  end
  
  def after_destroy
    Rails.cache.delete("Game/#{id}") if RAILS_ENV != 'development'
    Rails.cache.delete('Game.all')
    Rails.cache.delete('State.all')
    State.invalidate_cache
  end
  
  def self.fetch_all
    if RAILS_ENV != 'development'
      Rails.cache.fetch('Game.all') { all }
    else
      all
    end
  end
  
  def self.fetch(id)
    if RAILS_ENV != 'development'
      Rails.cache.fetch("Game/#{id}") { find(id) }
    else
      find(id)
    end
  end
  
  def self.invalidate_cache
    all.each do |g|
      Rails.cache.delete("Game/#{g.id}")
    end
  end
  
  def has_state(state)
    states.each do |s|
      return true if s.id == state.id
    end
    false
  end
  
  def create_constant
    state = ""
    if states.size > 1
      state = "_MULTI"
    elsif states.size == 1
      state = "_#{states[0].abbr.upcase}"
    else
      state = ""
    end
    constant_name = "#{name.gsub(' ', '_').gsub('-', '_').upcase}#{state}"
    unless Game.constants.index(constant_name)
      Game.const_set constant_name, self
    end
  end
  
  def init_generator
    options = {:sequenced => sequenced,
               :duplicates => duplicates,
               :regular_duplicates => regular_duplicates,
               :super_duplicates => super_duplicates
              }
    if number_of_super_balls > 0
      @generator = Generators::SuperGenerator.new(number_of_balls, 
                                     lowest_number, 
                                     highest_number, 
                                     number_of_super_balls, 
                                     lowest_super_number, 
                                     highest_super_number, 
                                     options)
    else
      @generator = Generators::Generator.new(number_of_balls,
                                lowest_number,
                                highest_number,
                                options)
    end
  end
  
  private :create_constant, :init_generator
end