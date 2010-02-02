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
    @sequenced = options[:sequenced]
    @duplicates = options[:duplicates]
    @regular_duplicates = options[:regular_duplicates]
    @super_duplicates = options[:super_duplicates]
  end
  
  def generate_random_numbers
    numbers = []
    snumbers = []
    (1..@number_of_balls).each do |i|
      num = @min_number + rand(@max_number)
      if !@regular_duplicates
        #regenerate the number if you can't have duplicates among the regular numbers
        redo if numbers.include?(num)
      end
      numbers << num
    end
    numbers.sort! if !@sequenced
    (1..@number_of_super_balls).each do |i|
      num = @min_super_number + rand(@max_super_number)
      if !@super_duplicates
        #regenerate the number if you can't have duplicates among the super numbers
        redo if snumbers.include?(num)
      end
      if !@duplicates
        #regenerate the number if you can't have duplicates between the regular and super numbers
        redo if numbers.include?(num)
      end
      snumbers << num
    end
    snumbers.sort! if !@sequenced
    
    {:numbers => numbers, :super_numbers => snumbers}
  end
end