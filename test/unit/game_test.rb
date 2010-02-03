require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "should create constants when loaded" do
    g = Game.find(1)
    assert Game::MEGAMILLIONS_MULTI
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
  
  test "has states" do
    g = Game.find(1)
    assert g.states
    assert g.states.size == 2
    
    g = Game.find(2)
    assert g.states
    assert g.states.size == 1
  end
  
  test "should allow hyphen in name: issue 21" do
    g = Game.new
    g.name = "Twenty-Five"
    assert g.save!
  end
  
  test "try to test leading zeros in 1 digit random numbers: issue 22" do
    g = Game.find(3)
    (0..1000).each do |i|
      n = g.generator.generate_random_numbers
      n = n[:numbers]
      if n[0].to_i >= 100 and n[0].to_i < 1000
        assert n[0].to_s.starts_with? "0"
      end
      if n[0].to_i > 10 and n[0].to_i < 100
        assert n[0].to_s.starts_with? "00"
      end
      if n[0].to_i < 10
        assert n[0].to_s.starts_with?"000"
      end
    end
  end
  
  test "when sequence is false balls are ordered" do
    g = Game.find(1)
    n = g.generator.generate_random_numbers
    r = n[:numbers]
    s = n[:super_numbers]
    
    i = 0
    r.each do |x|
      assert i < x
      i = x
    end
    i = 0
    s.each do |x|
      assert i < x
      i = x
    end
  end
  test "when sequence is true balls aren't ordered" do
    #how?
  end
  
  test "when regular_duplicates is false there cannot be duplicates" do
    #hmmm
  end
end
