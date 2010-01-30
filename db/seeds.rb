# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

def load_users
  User.create(:email => "mike.abner@gmail.com", :password => "password", :admin => true, :nickname => "Mike")
  User.create(:email => "mike.test@tlp.com", :password => "password", :admin => false, :nickname => "Test Mike")
  User.create(:email => "ekroboth@gmail.com", :password => "password", :admin => true, :nickname => "Liz")
  User.create(:email => "testliz@tlp.com", :password => "password", :admin => false, :nickname => "Test Liz")
  User.create(:email => "pevzner@gmail.com", :password => "password", :admin => true, :nickname => "Lev")
  User.create(:email => "testlev@tlp.com", :password => "password", :admin => false, :nickname => "Test Lev")
  User.create(:email => "kdred39@gmail.com", :password => "password", :admin => true, :nickname => "Kate")
  User.create(:email => "testkate@tlp.com", :password => "password", :admin => false, :nickname => "Test Kate")
end

def load_states
  State.create(:id => 1, :name => "Alabama", :abbr => "AL")
  State.create(:id => 2, :name => "Alaska", :abbr => "AK")
  State.create(:id => 3, :name => "Arizona", :abbr => "AZ")
  State.create(:id => 4, :name => "Arkansas", :abbr => "AR")
  State.create(:id => 5, :name => "California", :abbr => "CA")
  State.create(:id => 6, :name => "Colorado", :abbr => "CO")
  State.create(:id => 7, :name => "Connecticut", :abbr => "CT")
  State.create(:id => 8, :name => "Delaware", :abbr => "DE")
  State.create(:id => 9, :name => "Florida", :abbr => "FL")
  State.create(:id => 10, :name => "Georgia", :abbr => "GA")
  State.create(:id => 11, :name => "Hawaii", :abbr => "HI")
  State.create(:id => 12, :name => "Idaho", :abbr => "ID")
  State.create(:id => 13, :name => "Illinois", :abbr => "IL")
  State.create(:id => 14, :name => "Indiana", :abbr => "IN")
  State.create(:id => 15, :name => "Iowa", :abbr => "IA")
  State.create(:id => 16, :name => "Kansas", :abbr => "KS")
  State.create(:id => 17, :name => "Kentucky", :abbr => "KY")
  State.create(:id => 18, :name => "Louisiana", :abbr => "LA")
  State.create(:id => 19, :name => "Maine", :abbr => "ME")
  State.create(:id => 20, :name => "Maryland", :abbr => "MD")
  State.create(:id => 21, :name => "Massachusetts", :abbr => "MA")
  State.create(:id => 22, :name => "Michigan", :abbr => "MI")
  State.create(:id => 23, :name => "Minnesota", :abbr => "MN")
  State.create(:id => 24, :name => "Mississippi", :abbr => "MS")
  State.create(:id => 25, :name => "Missouri", :abbr => "MO")
  State.create(:id => 26, :name => "Montana", :abbr => "MT")
  State.create(:id => 27, :name => "Nebraska", :abbr => "NE")
  State.create(:id => 28, :name => "Nevada", :abbr => "NV")
  State.create(:id => 29, :name => "New Hampshire", :abbr => "NH")
  State.create(:id => 30, :name => "New Jersey", :abbr => "NJ")
  State.create(:id => 31, :name => "New Mexico", :abbr => "NM")
  State.create(:id => 32, :name => "New York", :abbr => "NY")
  State.create(:id => 33, :name => "North Carolina", :abbr => "NC")
  State.create(:id => 34, :name => "North Dakota", :abbr => "ND")
  State.create(:id => 35, :name => "Ohio", :abbr => "OH")
  State.create(:id => 36, :name => "Oklahoma", :abbr => "OK")
  State.create(:id => 37, :name => "Oregon", :abbr => "OR")
  State.create(:id => 38, :name => "Pennsylvania", :abbr => "PA")
  State.create(:id => 39, :name => "Rhode Island", :abbr => "RH")
  State.create(:id => 40, :name => "South Carolina", :abbr => "SC")
  State.create(:id => 41, :name => "South Dakota", :abbr => "SD")
  State.create(:id => 42, :name => "Tennessee", :abbr => "TN")
  State.create(:id => 43, :name => "Texas", :abbr => "TX")
  State.create(:id => 44, :name => "Utah", :abbr => "UT")
  State.create(:id => 45, :name => "Vermont", :abbr => "VT")
  State.create(:id => 46, :name => "Virginia", :abbr => "VA")
  State.create(:id => 47, :name => "Washington", :abbr => "WA")
  State.create(:id => 48, :name => "West Virginia", :abbr => "WV")
  State.create(:id => 49, :name => "Wisconsin", :abbr => "WI")
  State.create(:id => 50, :name => "Wyoming", :abbr => "WY")
  State.create(:id => 51, :name => "District of Columbia", :abbr => "DC")
  State.create(:id => 52, :name => "US Virgin Islands", :abbr => "VI")
end

def load_games
  Game.create(:name => "Two By Two",
              :display_name => "2by2",
              :number_of_balls => 2,
              :lowest_number => 1,
              :highest_number => 26,
              :number_of_super_balls => 2,
              :lowest_super_number => 1,
              :highest_super_number => 26,
              :sequenced => false,
              :duplicates => true,
              :regular_duplicates => false,
              :super_duplicates => false,
              :url => "http://www.arizonalottery.com/Games/2by2.html?GameID=11",
              :notes => "There are two 'red' numbers and two 'white'; for simplicity I input the Red in the RN columns and the White in the SN columns.  The two 'red' numbers must be unique and the two 'white' numbers must be unique, but a red number can be the same as a white number"
              )
  Game.create(:name => "Cash 4 AZ",
              :display_name => "Ca$h 4",
              :number_of_balls => 4,
              :lowest_number => 1,
              :highest_number => 26,
              :sequenced => false,
              :duplicates => false,
              :url => "http://www.arizonalottery.com/Games/CA$H4.html?GameID=9"
              )
end


load_states

#load_users
#load_games