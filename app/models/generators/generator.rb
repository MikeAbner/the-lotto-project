class Generators::Generator
  attr_reader :number_of_balls, 
              :min_number, 
              :max_number, 
              :sorted
  
  def initialize(num, min, max, options = {})
    @min_number = min
    @max_number = max
    @number_of_balls = num
    @sequenced = options[:sequenced]
    @regular_duplicates = options[:regular_duplicates]
  end
  
  def generate_random_numbers
    numbers = []
    (1..@number_of_balls).each do |i|
      num = @min_number + rand(@max_number)
      if !@regular_duplicates
        #regenerate the number if you can't have duplicates among the regular numbers
        redo if numbers.include?(num)
      end
      numbers << num
    end
    
    numbers.sort! if !@sequenced
    
    #add 000, 00, 0 to the front of numbers if the lottery only has 1 ball.
    if @number_of_balls == 1 and @max_number == 999
      if numbers[0].to_i < 10
        numbers[0] = "00#{numbers[0].to_s}"
      end
      if numbers[0].to_i >= 10 and numbers[0].to_i < 100
        numbers[0] = "0#{numbers[0].to_s}"
      end
    elsif @number_of_balls == 1 and @max_number == 9999
      if numbers[0].to_i < 10
        numbers[0] = "000#{numbers[0].to_s}"
      end
      if numbers[0].to_i >= 10 and numbers[0].to_i < 100
        numbers[0] = "00#{numbers[0].to_s}"
      end
      if numbers[0].to_i >= 100 and numbers[0].to_i < 1000
        numbers[0] = "0#{numbers[0].to_s}"
      end
    end
    
    {:numbers => numbers}
  end
end