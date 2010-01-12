class State < LookupTable
  attr_accessor :abbr
  
  def initialize(id, name, abbr)
    super id, name
    @abbr = abbr
  end
  
  def self.find_by_abbr(abbr)
    values.each { |s| return s if s.abbr == abbr}
    nil
  end  

  add_value State.new(1, "Alabama", "AL")
  add_value State.new(2, "Alaska", "AK")
  add_value State.new(3, "Arizona", "AZ")
  add_value State.new(4, "Arkansas", "AR")
  add_value State.new(5, "California", "CA")
  add_value State.new(6, "Colorado", "CO")
  add_value State.new(7, "Connecticut", "CT")
  add_value State.new(8, "Delaware", "DE")
  add_value State.new(9, "Florida", "FL")
  add_value State.new(10, "Georgia", "GA")
  add_value State.new(11, "Hawaii", "HI")
  add_value State.new(12, "Idaho", "ID")
  add_value State.new(13, "Illinois", "IL")
  add_value State.new(14, "Indiana", "IN")
  add_value State.new(15, "Iowa", "IA")
  add_value State.new(16, "Kansas", "KS")
  add_value State.new(17, "Kentucky", "KY")
  add_value State.new(18, "Louisiana", "LA")
  add_value State.new(19, "Maine", "ME")
  add_value State.new(20, "Maryland", "MD")
  add_value State.new(21, "Massachusetts", "MA")
  add_value State.new(22, "Michigan", "MI")
  add_value State.new(23, "Minnesota", "MN")
  add_value State.new(24, "Mississippi", "MS")
  add_value State.new(25, "Missouri", "MO")
  add_value State.new(26, "Montana", "MT")
  add_value State.new(27, "Nebraska", "NE")
  add_value State.new(28, "Nevada", "NV")
  add_value State.new(29, "New Hampshire", "NH")
  add_value State.new(30, "New Jersey", "NJ")
  add_value State.new(31, "New Mexico", "NM")
  add_value State.new(32, "New York", "NY")
  add_value State.new(33, "North Carolina", "NC")
  add_value State.new(34, "North Dakota", "ND")
  add_value State.new(35, "Ohio", "OH")
  add_value State.new(36, "Oklahoma", "OK")
  add_value State.new(37, "Oregon", "OR")
  add_value State.new(38, "Pennsylvania", "PA")
  add_value State.new(39, "Rhode Island", "RH")
  add_value State.new(40, "South Carolina", "SC")
  add_value State.new(41, "South Dakota", "SD")
  add_value State.new(42, "Tennessee", "TN")
  add_value State.new(43, "Texas", "TX")
  add_value State.new(44, "Utah", "UT")
  add_value State.new(45, "Vermont", "VT")
  add_value State.new(46, "Virginia", "VA")
  add_value State.new(47, "Washington", "WA")
  add_value State.new(48, "West Virginia", "WV")
  add_value State.new(49, "Wisconsin", "WI")
  add_value State.new(50, "Wyoming", "WY")
  add_value State.new(51, "District of Columbia", "DC")
  add_value State.new(52, "US Virgin Islands", "VI")

end
