# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create(:email => "mike.abner@gmail.com", :password => "password", :admin => true, :nickname => "Mike")
User.create(:email => "mike.test@tlp.com", :password => "password", :admin => false, :nickname => "Test Mike")
User.create(:email => "ekroboth@gmail.com", :password => "password", :admin => true, :nickname => "Liz")
User.create(:email => "testliz@tlp.com", :password => "password", :admin => false, :nickname => "Test Liz")
User.create(:email => "pevzner@gmail.com", :password => "password", :admin => true, :nickname => "Lev")
User.create(:email => "testlev@tlp.com", :password => "password", :admin => false, :nickname => "Test Lev")
User.create(:email => "kdred39@gmail.com", :password => "password", :admin => true, :nickname => "Kate")
User.create(:email => "tetkate@tlp.com", :password => "password", :admin => false, :nickname => "Test Kate")