require 'test_helper'

class StatesTest < ActiveSupport::TestCase
  test "creates a constant when loaded" do
    s = State.find(1)
    assert State::CALIFORNIA
    assert State::CA
  end
  
  test "has games" do
    s = State.find(1)
    assert s.games
    assert s.games.size == 3
    
    s = State.find(2)
    assert s.games
    assert s.games.size == 1
  end
end
