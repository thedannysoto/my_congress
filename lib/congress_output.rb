# require 'require_all'
# require_all 'lib'
# require 'colorize'

class CongressOutput

    def initialize(sen1, sen2, rep, dist, state)
        Header.new
        puts "Congressional Representative for the State of #{state.capitalize}, District #{dist}: ".colorize(:blue) + "#{rep[:name]}"
        puts " "
        puts "Party Affiliation: ".colorize(:red) + "#{rep[:party]}"
        puts "Phone: ".colorize(:red) + "#{rep[:phone]}"
        puts "Twitter: ".colorize(:red) + "#{rep[:twitter]}"
        puts "Facebook: ".colorize(:red) + "#{rep[:facebook]}"
        puts "Website: ".colorize(:red) + "#{rep[:website]}"
        puts "------------------------------------------------------------------------------------------"
        puts "U.S. Senator for the State of #{state.capitalize}: ".colorize(:blue) + "#{sen1[:name]}"
        puts " "
        puts "Party Affiliation: ".colorize(:red) + "#{sen1[:party]}"
        puts "Phone: ".colorize(:red) + "#{sen1[:phone]}"
        puts "Twitter: ".colorize(:red) + "#{sen1[:twitter]}"
        puts "Facebook: ".colorize(:red) + "#{sen1[:facebook]}"
        puts "Website: ".colorize(:red) + "#{sen1[:website]}"
        puts "------------------------------------------------------------------------------------------"
        puts "U.S. Senator for the State of #{state.capitalize}: ".colorize(:blue) + "#{sen2[:name]}"
        puts " "
        puts "Party Affiliation: ".colorize(:red) + "#{sen2[:party]}"
        puts "Phone: ".colorize(:red) + "#{sen2[:phone]}"
        puts "Twitter: ".colorize(:red) + "#{sen2[:twitter]}"
        puts "Facebook: ".colorize(:red) + "#{sen2[:facebook]}"
        puts "Website: ".colorize(:red) + "#{sen2[:website]}"
        puts "------------------------------------------------------------------------------------------"
        puts " "
        puts "Enter '1' to return to Main Menu.".colorize(:blue)
        puts "Enter '2' to see upcoming elections in your area.".colorize(:blue)
        puts "Type 'exit' to leave My Congress.".colorize(:blue)
        choice = gets.chomp
        if choice != '1' && choice != '2' && choice.upcase != 'EXIT'
            puts "Invalid input. Press 'Enter' to return to Main Menu."
            nothing = gets.chomp
            MyCongress.new.call
        elsif choice == '1'
            MyCongress.new.call
        elsif choice == '2'
            UpcomingElections.new(state)
        else
            ProgramEnd.new
        end
    end
end