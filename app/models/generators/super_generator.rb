class Generators::SuperGenerator
  attr_reader :number_of_balls, 
              :min_number, 
              :max_number, 
              :number_of_super_balls, 
              :min_super_number, 
              :max_super_number,
              :sorted
  
  def initialize(num, min, max, snum, smin, smax, options = {})
    @number_of_balls = num
    @min_number = min
    @max_number = max
    @number_of_super_balls = snum
    @min_super_number = smin
    @max_super_number = smax
    @sorted = options[:sorted] ||= false
  end
  
  def generate_random_numbers
    numbers = []
    snumbers = []
    (1..@number_of_balls).each do |i|
      num = @min_number + rand(@max_number)
      redo if numbers.include?(num)      
      numbers << num
    end
    numbers.sort!
    (1..@number_of_super_balls).each do |i|
      num = @min_super_number + rand(@max_super_number)
      redo if snumbers.include?(num)      
      snumbers << num
    end
    snumbers.sort!
    numbers.concat snumbers
    
    numbers
  end
end