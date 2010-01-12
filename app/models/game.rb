class Game < LookupTable
  attr_accessor :nice_name,
                :states,
                :generator,
                :analyzer, 
                :last_draw_date,
                :last_draw_numbers,
                :last_draw_result,
                :next_draw_date,
                :jackpot_value,
                :cash_value

  def initialize(id, name, states, generator, analyzer)
    if states.size == 0
      super id, "#{name} #{states[0].abbr}"
    else
      super id, name
    end
    @nice_name = name
    @states = states
    @generator = generator
    @analyzer = analyzer
  end
  
  def self.add_value(value)
    constant_name = "#{value.name.gsub(' ', '_')}_#{value.states[0].abbr}".upcase
    unless constants.index(constant_name)
      values << value
      const_set constant_name, value
    end
  end
  
  def self.find_by_state(state)
    values.map{ |g| g if g.states.include? state }.delete_if { |x| x.nil? }
  end

  def users
    ugs = UserGame.find(:all, :conditions => {:game_id => id})
    return [] if ugs.nil?
    u = []
    ugs.each do |ug|
      u << ug.user_id
    end
    u
  end

  def played_numbers
    pns = PlayedNumbers.find(:all, :conditions => {:game_id => id})
  end

  def generate_numbers(options = nil)
    if options.nil? or options.size == 0
      return @generator.generate_random_numbers
    end
  end

  def most_frequent_numbers
    @analyzer.most_frequent_numbers
  end
  
  def least_frequent_numbers
    @analyzer.least_frequent_numbers
  end
  
  def most_frequent_range
    @analyzer.most_frequent_range
  end
  
  def least_frequent_range
    @analyzer.least_frequent_range
  end
  
  def average_span
    @analyzer.average_span
  end

  add_value Game.new(1, "Powerball", [State::OREGON, 
                                      State::IDAHO,
                                      State::MONTANA,
                                      State::ARIZONA,
                                      State::NEW_MEXICO,
                                      State::COLORADO,
                                      State::NORTH_DAKOTA,
                                      State::SOUTH_DAKOTA,
                                      State::NEBRASKA,
                                      State::KANSAS,
                                      State::OKLAHOMA,
                                      State::LOUISIANA,
                                      State::ARKANSAS,
                                      State::MISSOURI,
                                      State::IOWA,
                                      State::MINNESOTA,
                                      State::WISCONSIN,
                                      State::INDIANA,
                                      State::KENTUCKY,
                                      State::TENNESSEE,
                                      State::FLORIDA,
                                      State::SOUTH_CAROLINA,
                                      State::NORTH_CAROLINA,
                                      State::WEST_VIRGINIA,
                                      State::DISTRICT_OF_COLUMBIA,
                                      State::DELAWARE,
                                      State::PENNSYLVANIA,
                                      State::CONNECTICUT,
                                      State::RHODE_ISLAND,
                                      State::VERMONT,
                                      State::NEW_HAMPSHIRE,
                                      State::MAINE,
                                      State::US_VIRGIN_ISLANDS], 
                                      Generators::SuperGenerator.new(5, 1, 59, 1, 1, 39, {:sorted => true}), 
                                      Analyzers::PowerballAnalyzer.new)
  add_value Game.new(2, "Mega Millions", [State::CALIFORNIA,
                                          State::GEORGIA,
                                          State::ILLINOIS,
                                          State::MARYLAND,
                                          State::MASSACHUSETTS,
                                          State::MICHIGAN,
                                          State::NEW_JERSEY,
                                          State::NEW_YORK,
                                          State::OHIO,
                                          State::TEXAS,
                                          State::VIRGINIA,
                                          State::WASHINGTON], 
                                          Generators::SuperGenerator.new(5, 1, 56, 1, 1, 46, {:sorted => true}), 
                                          Analyzers::MegaMillionsAnalyzer.new)
  add_value Game.new(3, "Hot Lotto", [State::DISTRICT_OF_COLUMBIA,
                                      State::DELAWARE,
                                      State::NEW_HAMPSHIRE,
                                      State::MAINE,
                                      State::VERMONT,
                                      State::WEST_VIRGINIA,
                                      State::IOWA,
                                      State::MINNESOTA,
                                      State::NORTH_DAKOTA,
                                      State::SOUTH_DAKOTA,
                                      State::KANSAS,
                                      State::OKLAHOMA,
                                      State::NEW_MEXICO,
                                      State::MONTANA,
                                      State::IDAHO], Generators::SuperGenerator.new(5, 1, 39, 1, 1, 19), nil)
  add_value Game.new(4, "Wildcard 2", [State::IDAHO,
                                       State::MONTANA,
                                       State::NORTH_DAKOTA,
                                       State::SOUTH_DAKOTA], Generators::SuperGenerator.new(5, 1, 31, 1, 1, 16), nil)
  add_value Game.new(5, "Two by Two", [State::ARIZONA,
                                       State::NORTH_DAKOTA,
                                       State::KANSAS,
                                       State::NEBRASKA], Generators::Generator.new(4, 1, 26), nil)
  add_value Game.new(6, "Win 4 Life", [State::GEORGIA,
                                       State::KENTUCKY,
                                       State::VIRGINIA], Generators::SuperGenerator.new(6, 1, 42, 1, 1, 36), nil) #need exception
  add_value Game.new(7, "Tri State Megabucks", [State::MAINE,
                                                State::NEW_HAMPSHIRE,
                                                State::VERMONT], Generators::SuperGenerator.new(5, 1, 41, 1, 1, 6), nil)
  add_value Game.new(8, "Tri State Weekly Grand", [State::MAINE,
                                                   State::NEW_HAMPSHIRE,
                                                   State::VERMONT], Generators::SuperGenerator.new(5, 1, 35, 1, 1, 35), nil)
  add_value Game.new(9, "CASH 4",     [State::ARIZONA], Generators::Generator.new(4, 1, 26), nil)
  add_value Game.new(10, "The Pick",   [State::ARIZONA], Generators::Generator.new(6, 1, 44), nil)
  add_value Game.new(11, "Pick 5",     [State::ARIZONA], Generators::Generator.new(5, 1, 39), nil)
  add_value Game.new(12, "Pick 3",     [State::ARIZONA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(13, "Cash 4",     [State::ARKANSAS], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(14, "Cash 3",    [State::ARKANSAS], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(15, "SuperLOTTO Plus", [State::CALIFORNIA], Generators::SuperGenerator.new(5, 1, 47, 1, 1, 27), nil)
  add_value Game.new(16, "Fantasy 5", [State::CALIFORNIA], Generators::Generator.new(5, 1, 39), nil)
  add_value Game.new(17, "Fantasy 4", [State::CALIFORNIA], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(18, "Daily 3",   [State::CALIFORNIA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(19, "Lotto", [State::COLORADO], Generators::Generator.new(6, 1, 42), nil)
  add_value Game.new(20, "Cash 5", [State::COLORADO], Generators::Generator.new(5, 1, 32), nil)
  add_value Game.new(21, "Classic Lotto", [State::CONNECTICUT], Generators::Generator.new(6, 1, 44), nil)
  add_value Game.new(22, "Cash 5", [State::CONNECTICUT], Generators::Generator.new(5, 1, 35), nil)
  add_value Game.new(23, "Lucky 4 Life", [State::CONNECTICUT], Generators::SuperGenerator.new(4, 1, 39, 1, 1, 39), nil)
  add_value Game.new(24, "Play 3 Day", [State::CONNECTICUT], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(25, "Play 4 Day", [State::CONNECTICUT], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(26, "Play 3 Night", [State::CONNECTICUT], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(27, "Play 4 Night", [State::CONNECTICUT], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(28, "Multi Win Lotto", [State::DELAWARE], Generators::Generator.new(6, 1, 35), nil)
  add_value Game.new(29, "Play 3 Day", [State::DELAWARE], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(30, "Play 4 Day", [State::DELAWARE], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(31, "Play 3 Night", [State::DELAWARE], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(32, "Play 4 Night", [State::DELAWARE], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(33, "Lucky Numbers", [State::DISTRICT_OF_COLUMBIA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(34, "DC 4", [State::DISTRICT_OF_COLUMBIA], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(35, "DC 5", [State::DISTRICT_OF_COLUMBIA], Generators::Generator.new(5, 0, 9), nil)
  add_value Game.new(36, "DC Daily 6", [State::DISTRICT_OF_COLUMBIA], Generators::SuperGenerator.new(6, 1, 39, 1, 1, 39), nil)
  add_value Game.new(37, "Florida Lotto", [State::FLORIDA], Generators::Generator.new(6, 1, 53), nil)
  add_value Game.new(38, "Mega Money", [State::FLORIDA], Generators::SuperGenerator.new(4, 1, 44, 1, 1, 22), nil)  #need exception
  add_value Game.new(39, "Fantasy 5", [State::FLORIDA], Generators::Generator.new(5, 1, 36), nil)
  add_value Game.new(40, "Play 4", [State::FLORIDA], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(41, "Cash 3", [State::FLORIDA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(42, "Fantasy 5", [State::GEORGIA], Generators::Generator.new(5, 1, 39), nil)
  add_value Game.new(43, "Cash 4", [State::GEORGIA], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(44, "Cash 3", [State::GEORGIA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(45, "Pick 3", [State::IDAHO], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(46, "Double Play Daily", [State::IDAHO], Generators::Generator.new(5, 1, 36), nil)
  add_value Game.new(47, "Lotto", [State::ILLINOIS], Generators::Generator.new(6, 1, 52), nil)
  add_value Game.new(48, "Little Lotto", [State::ILLINOIS], Generators::Generator.new(5, 1, 39), nil)
  add_value Game.new(49, "Pick 4", [State::ILLINOIS], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(50, "Pick 3", [State::ILLINOIS], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(51, "Hoosier Lotto", [State::INDIANA], Generators::SuperGenerator.new(5, 1, 59, 1, 1, 39), nil)
  add_value Game.new(52, "Quick Draw", [State::INDIANA], Generators::Generator.new(10, 1, 80), nil)
  add_value Game.new(53, "Lucky 5", [State::INDIANA], Generators::Generator.new(5, 1, 100), nil)  #what is the largest number????
  add_value Game.new(54, "Daily 4", [State::INDIANA], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(55, "Daily 3", [State::INDIANA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(56, "Mix And Match", [State::INDIANA], Generators::Generator.new(5, 1, 50), nil)
  add_value Game.new(57, "One Hundred K Cash Game", [State::IOWA], Generators::Generator.new(5, 1, 35), nil)
  add_value Game.new(58, "Pick 4", [State::IOWA], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(59, "Pick 3", [State::IOWA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(60, "Super Kansas Cash", [State::KANSAS], Generators::SuperGenerator.new(5, 1, 32, 1, 1, 25), nil)
  add_value Game.new(61, "Pick 3", [State::KANSAS], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(62, "Cash Ball", [State::KENTUCKY], Generators::SuperGenerator.new(4, 1, 33, 1, 1, 31), nil)
  add_value Game.new(63, "Three Line Lotto", [State::KENTUCKY], Generators::Generator.new(6, 1, 39), nil)
  add_value Game.new(64, "Pick 4", [State::KENTUCKY], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(65, "Pick 3", [State::KENTUCKY], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(66, "Lotto", [State::LOUISIANA], Generators::Generator.new(6, 1, 40), nil)
  add_value Game.new(67, "Easy 5", [State::LOUISIANA], Generators::Generator.new(5, 1, 37), nil)
  add_value Game.new(68, "Pick 4", [State::LOUISIANA], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(69, "Pick 3", [State::LOUISIANA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(70, "Pick 4", [State::MAINE], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(71, "Pick 3", [State::MAINE], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(72, "Bonus Match 5", [State::MARYLAND], Generators::SuperGenerator.new(5, 1, 39, 1, 1, 39), nil) #needs exception
  add_value Game.new(73, "Multi Match", [State::MARYLAND], Generators::Generator.new(6, 1, 43), nil)
  add_value Game.new(74, "Pick 4", [State::MARYLAND], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(75, "Pick 3", [State::MARYLAND], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(76, "Cash Winfall", [State::MASSACHUSETTS], Generators::Generator.new(6, 1, 46), nil)
  add_value Game.new(77, "Megabucks Doubler", [State::MASSACHUSETTS], Generators::Generator.new(6, 1, 49), nil)
  add_value Game.new(78, "Mass Cash", [State::MASSACHUSETTS], Generators::Generator.new(5, 1, 35), nil)
  add_value Game.new(79, "Numbers Game", [State::MASSACHUSETTS], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(80, "Cash Lotto 47", [State::MICHIGAN], Generators::Generator.new(6, 1, 47), nil)
  add_value Game.new(81, "Fantasy 5", [State::MICHIGAN], Generators::Generator.new(5, 1, 39), nil)
  add_value Game.new(82, "Daily 4", [State::MICHIGAN], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(83, "Daily 3", [State::MICHIGAN], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(84, "Gopher 5", [State::MINNESOTA], Generators::Generator.new(5, 1, 47), nil)
  add_value Game.new(85, "Northstar Cash", [State::MINNESOTA], Generators::Generator.new(5, 1, 31), nil)
  add_value Game.new(86, "Daily 3", [State::MINNESOTA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(87, "Lotto", [State::MISSOURI], Generators::Generator.new(6, 1, 44), nil)
  add_value Game.new(88, "Show Me Cash", [State::MISSOURI], Generators::Generator.new(5, 1, 39), nil)
  add_value Game.new(89, "Pick 4", [State::MISSOURI], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(90, "Pick 3", [State::MISSOURI], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(91, "Montana Cash", [State::MONTANA], Generators::Generator.new(5, 1, 37), nil)
  add_value Game.new(92, "Pick 5", [State::NEBRASKA], Generators::Generator.new(5, 1, 38), nil)
  add_value Game.new(93, "Pick 3", [State::NEBRASKA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(94, "Pick 4", [State::NEW_HAMPSHIRE], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(95, "Pick 3", [State::NEW_HAMPSHIRE], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(96, "Pick 6 Lotto", [State::NEW_JERSEY], Generators::Generator.new(6, 1, 49), nil)
  add_value Game.new(97, "Jersey Cash 5", [State::NEW_JERSEY], Generators::Generator.new(5, 1, 40), nil)
  add_value Game.new(98, "Pick 4", [State::NEW_JERSEY], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(99, "Pick 3", [State::NEW_JERSEY], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(100, "Roadrunner Cash", [State::NEW_MEXICO], Generators::Generator.new(5, 1, 37), nil)
  add_value Game.new(101, "Pick 3", [State::NEW_MEXICO], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(102, "Sweet Million", [State::NEW_YORK], Generators::Generator.new(6, 1, 40), nil)
  add_value Game.new(103, "Lotto", [State::NEW_YORK], Generators::Generator.new(6, 1, 59), nil)
  add_value Game.new(104, "Take 5", [State::NEW_YORK], Generators::Generator.new(5, 1, 39), nil)
  add_value Game.new(105, "Numbers", [State::NEW_YORK], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(106, "Win 4", [State::NEW_YORK], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(107, "Quick Draw", [State::NEW_YORK], Generators::Generator.new(10, 1, 80), nil)
  add_value Game.new(108, "Pick 10", [State::NEW_YORK], Generators::Generator.new(10, 1, 80), nil)
  add_value Game.new(109, "Cash 5", [State::NORTH_CAROLINA], Generators::Generator.new(5, 1, 39), nil)
  add_value Game.new(110, "Pick 4", [State::NORTH_CAROLINA], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(111, "Pick 3", [State::NORTH_CAROLINA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(112, "Classic Lotto", [State::OHIO], Generators::Generator.new(6, 1, 49), nil)
  add_value Game.new(113, "Rolling Cash 5", [State::OHIO], Generators::Generator.new(5, 1, 39), nil)
  add_value Game.new(114, "Ten Oh", [State::OHIO], Generators::Generator.new(10, 1, 80), nil)
  add_value Game.new(115, "Cash 5", [State::OKLAHOMA], Generators::Generator.new(5, 1, 36), nil)
  add_value Game.new(116, "Pick 3", [State::OKLAHOMA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(117, "Megabucks", [State::OREGON], Generators::Generator.new(6, 1, 48), nil)
  add_value Game.new(118, "Win 4 Life", [State::OREGON], Generators::Generator.new(4, 1, 77), nil)
  add_value Game.new(119, "Pick 4", [State::OREGON], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(120, "Lucky Lines", [State::OREGON], Generators::Generator.new(8, 1, 32), nil)  #needs special rules
  add_value Game.new(121, "Super 7", [State::PENNSYLVANIA], Generators::Generator.new(11, 1, 77), nil)
  add_value Game.new(122, "Cash 5", [State::PENNSYLVANIA], Generators::Generator.new(5, 1, 43), nil)
  add_value Game.new(123, "Mix and Match", [State::PENNSYLVANIA], Generators::Generator.new(5, 1, 19), nil) # needs not to be sorted
  add_value Game.new(124, "Treasure Hunt", [State::PENNSYLVANIA], Generators::Generator.new(5, 1, 30), nil)
  add_value Game.new(125, "Quinto", [State::PENNSYLVANIA], Generators::Generator.new(5, 0, 9), nil)
  add_value Game.new(126, "Big 4", [State::PENNSYLVANIA], Generators::Generator.new(4, 0, 9), nil)  #need to be able to allow duplicates
  add_value Game.new(127, "The Daily Number", [State::PENNSYLVANIA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(128, "Wild Money", [State::RHODE_ISLAND], Generators::SuperGenerator.new(5, 1, 35, 1, 1, 35), nil)  #super can't match others
  add_value Game.new(129, "The Numbers Game", [State::RHODE_ISLAND], Generators::Generator.new(4, 0, 9), nil)  #wierd drawings  
  add_value Game.new(130, "Palmetto Cash 5", [State::SOUTH_CAROLINA], Generators::Generator.new(5, 1, 38), nil)
  add_value Game.new(131, "Pick 4", [State::SOUTH_CAROLINA], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(132, "Pick 3", [State::SOUTH_CAROLINA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(133, "Dakota Cash", [State::SOUTH_DAKOTA], Generators::Generator.new(5, 1, 35), nil)
  add_value Game.new(134, "Lotto Plus", [State::TENNESSEE], Generators::Generator.new(6, 1, 44), nil)
  add_value Game.new(135, "Pick 5", [State::TENNESSEE], Generators::Generator.new(5, 1, 39), nil)
  add_value Game.new(136, "Cash 4", [State::TENNESSEE], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(137, "Cash 3", [State::TENNESSEE], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(138, "Lotto Texas", [State::TEXAS], Generators::Generator.new(6, 1, 54), nil)
  add_value Game.new(139, "Texas Two Step", [State::TEXAS], Generators::Generator.new(4, 1, 35), nil)
  add_value Game.new(140, "Cash 5", [State::TEXAS], Generators::Generator.new(5, 1, 37), nil)
  add_value Game.new(141, "Daily 4", [State::TEXAS], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(142, "Pick 3", [State::TEXAS], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(143, "Pick 4", [State::VERMONT], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(144, "Pick 3", [State::VERMONT], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(145, "Cash 5", [State::VIRGINIA], Generators::Generator.new(5, 1, 34), nil)
  add_value Game.new(146, "Pick 4", [State::VIRGINIA], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(147, "Pick 3", [State::VIRGINIA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(148, "Lotto", [State::WASHINGTON], Generators::Generator.new(6, 1, 49), nil)
  add_value Game.new(149, "Hit 5", [State::WASHINGTON], Generators::Generator.new(5, 1, 39), nil)
  add_value Game.new(150, "Match 4", [State::WASHINGTON], Generators::Generator.new(4, 1, 24), nil)
  add_value Game.new(151, "Daily Game", [State::WASHINGTON], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(152, "Cash 25", [State::WEST_VIRGINIA], Generators::Generator.new(6, 1, 25), nil)
  add_value Game.new(153, "Daily 4", [State::WEST_VIRGINIA], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(154, "Daily 3", [State::WEST_VIRGINIA], Generators::Generator.new(3, 0, 9), nil)
  add_value Game.new(155, "Megabucks", [State::WISCONSIN], Generators::Generator.new(6, 1, 49), nil)
  add_value Game.new(156, "SuperCash", [State::WISCONSIN], Generators::Generator.new(6, 1, 39), nil)
  add_value Game.new(157, "Badger 5", [State::WISCONSIN], Generators::Generator.new(5, 1, 31), nil)
  add_value Game.new(158, "Pick 4", [State::WISCONSIN], Generators::Generator.new(4, 0, 9), nil)
  add_value Game.new(159, "Pick 3", [State::WISCONSIN], Generators::Generator.new(3, 0, 9), nil)
end
