class Generators::Generator
  attr_reader :number_of_balls, 
              :min_number, 
              :max_number, 
              :sorted
  
  def initialize(num, min, max, options = {})
    @min_number = min
    @max_number = max
    @number_of_balls = num
    @sorted = options[:sorted] ||= false
  end
  
  def generate_random_numbers
    numbers = []
    (1..@number_of_balls).each do |i|
      num = @min_number + rand(@max_number)
      redo if numbers.include?(num)      
      numbers << num
    end
    numbers.sort!
    
    numbers
  end
end