require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "should create constants when loaded" do
    g = Game.find(1)
    assert Game::MEGAMILLIONS_CA
  end
  
  test "should configure generator when loaded" do
    g = Game.find(2)
    assert g.generator
    assert g.generator.number_of_balls
    assert g.generator.min_number
    assert g.generator.max_number
    assert g.generator.sequenced
    assert g.regular_duplicates
  end
  
  test "should configure super generator when loaded" do
    g = Game.find(1)
    assert g.generator
    assert g.generator.number_of_balls
    assert g.generator.min_number
    assert g.generator.max_number
    assert g.number_of_super_balls
    assert g.lowest_super_number
    assert g.highest_super_number
    assert g.generator.sequenced == false
    assert g.duplicates
    assert g.regular_duplicates == false
    assert g.super_duplicates == false
  end
  
  test "should allow hyphen in name: issue 21" do
    g = Game.new
    g.name = "Twenty-Five"
    assert g.save!
  end
end
