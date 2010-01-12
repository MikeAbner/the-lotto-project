class LookupTable
  attr_accessor :id, :name
  
  def initialize(id, name)
    @id = id
    @name = name
  end
  
  def self.add_value(value)
    constant_name = value.name.gsub(' ', '_').upcase
    unless constants.index(constant_name)
      values << value
      const_set constant_name, value
    end
  end
  
  def self.values
    @values || @values = []
  end
  
  def self.all
    values
  end
  
  def self.find(id)
    values.each { |s| return s if s.id == id }
    nil
  end
  
  def self.find_by_name(name)
    values.each { |s| return s if s.name == name }
    nil
  end
end