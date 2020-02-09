class CongressOutput

    def initialize(sen1, sen2, rep, dist, address)
        Header.new
        puts "Congressional Representative for the State of #{address[:state].capitalize}, District #{dist}: ".colorize(:blue) + "#{rep[:name]}"
        puts " "
        puts "Party Affiliation: ".colorize(:red) + "#{rep[:party]}"
        puts "Phone: ".colorize(:red) + "#{rep[:phone]}"
        puts "Twitter: ".colorize(:red) + "#{rep[:twitter]}"
        puts "Facebook: ".colorize(:red) + "#{rep[:facebook]}"
        puts "Website: ".colorize(:red) + "#{rep[:website]}"
        puts "------------------------------------------------------------------------------------------"
        puts "U.S. Senator for the State of #{address[:state].capitalize}: ".colorize(:blue) + "#{sen1[:name]}"
        puts " "
        puts "Party Affiliation: ".colorize(:red) + "#{sen1[:party]}"
        puts "Phone: ".colorize(:red) + "#{sen1[:phone]}"
        puts "Twitter: ".colorize(:red) + "#{sen1[:twitter]}"
        puts "Facebook: ".colorize(:red) + "#{sen1[:facebook]}"
        puts "Website: ".colorize(:red) + "#{sen1[:website]}"
        puts "------------------------------------------------------------------------------------------"
        puts "U.S. Senator for the State of #{address[:state].capitalize}: ".colorize(:blue) + "#{sen2[:name]}"
        puts " "
        puts "Party Affiliation: ".colorize(:red) + "#{sen2[:party]}"
        puts "Phone: ".colorize(:red) + "#{sen2[:phone]}"
        puts "Twitter: ".colorize(:red) + "#{sen2[:twitter]}"
        puts "Facebook: ".colorize(:red) + "#{sen2[:facebook]}"
        puts "Website: ".colorize(:red) + "#{sen2[:website]}"
        puts "------------------------------------------------------------------------------------------"
        puts " "

        prompt = TTY::Prompt.new(active_color: :blue)
        choice = prompt.select("Please make a selection from the menu:".colorize(:red)) do |menu|
            menu.choice 'See upcoming elections in my area', "2"
            menu.choice 'See current headlines in U.S. Politics', "3"
            menu.choice 'See list of upcoming bills for House and Senate', "4"
            menu.choice 'Return to Main Menu', "1"
            menu.choice 'Exit My Congress', "EXIT"
        end 
     
        if choice == '1'
            MyCongress.new.call
        elsif choice == '2'
            UpcomingElections.new(address)
        elsif choice == '3'
            Headlines.new
        elsif choice == '4'
            Bills.new
        else
            ProgramEnd.new
        end
    end
end