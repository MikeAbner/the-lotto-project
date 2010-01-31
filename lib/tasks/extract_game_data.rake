namespace :db do
  namespace :extract do
    task :games => :environment do
      File.open("./db/game_data.yml", "w") do |f|
        states = State.all
      
        states.each do |s|
          f.write("#{s.name.gsub(' ', '_')}:\n")
          f.write("\tid: #{s.id}\n")
          f.write("\tname: #{s.name}\n")
          f.write("\tabbr: #{s.abbr}\n")
          
          s.games.each do |g|
            f.write("\t#{g.display_name.gsub(' ','_')}:\n")
            f.write("\t\tname: #{g.name}\n")
            f.write("\t\tdisplay_name: #{g.display_name}\n")
            f.write("\t\tnumber_of_balls: #{g.number_of_balls}\n")
            f.write("\t\tlowest_number: #{g.lowest_number}\n")
            f.write("\t\thighest_number: #{g.highest_number}\n")
            f.write("\t\tnumber_of_super_balls: #{g.number_of_super_balls}\n")
            f.write("\t\tlowest_super_number: #{g.lowest_super_number}\n")
            f.write("\t\thighest_super_number: #{g.highest_super_number}\n")
            f.write("\t\tsequenced: #{g.sequenced}\n")
            f.write("\t\tduplicates: #{g.duplicates}\n")
            f.write("\t\tregular_duplicates: #{g.regular_duplicates}\n")
            f.write("\t\tsuper_duplicates: #{g.super_duplicates}\n")
            f.write("\t\turl: #{g.url}\n")
            f.write("\t\tnotes: #{g.notes}\n")
          end
          
          
        end
      end
    end
  end
end