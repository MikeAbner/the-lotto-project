# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

#User.create(:email => "mike.abner@gmail.com", :password => "password", :admin => true, :nickname => "Mike")
#User.create(:email => "mike.test@tlp.com", :password => "password", :admin => false, :nickname => "Test Mike")
#User.create(:email => "ekroboth@gmail.com", :password => "password", :admin => true, :nickname => "Liz")
#User.create(:email => "testliz@tlp.com", :password => "password", :admin => false, :nickname => "Test Liz")
#User.create(:email => "pevzner@gmail.com", :password => "password", :admin => true, :nickname => "Lev")
#User.create(:email => "testlev@tlp.com", :password => "password", :admin => false, :nickname => "Test Lev")
#User.create(:email => "kdred39@gmail.com", :password => "password", :admin => true, :nickname => "Kate")
#User.create(:email => "tetkate@tlp.com", :password => "password", :admin => false, :nickname => "Test Kate")

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