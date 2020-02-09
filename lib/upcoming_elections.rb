class UpcomingElections

    def initialize(address)
        page = Nokogiri::HTML(open("https://www.vote411.org/#{address[:state].downcase}"))
        Header.new
        puts '"We do not have government by the majority.'
        puts 'We have government by the majority who participate."'
        puts '                                                         -Thomas Jefferson'
        puts "------------------------------------------------------------------------------------------"
        puts " "
        puts "Upcoming Elections for #{address[:state].capitalize}: ".colorize(:blue)
        puts "------------------------------------------------------------------------------------------"
        puts " "
        puts "Election Type: ".colorize(:red) + page.css("div.heading").text.strip.split(": ")[1]
        puts "Election Date: ".colorize(:red) + page.css("div.date").text.strip
        puts " "
        puts "------------------------------------------------------------------------------------------"
        puts " "
        if page.css("div.col-5.special-election-tag")[0] != nil 
            puts "Election Type: ".colorize(:red) + page.css("div.col-5.special-election-tag")[0].text.strip
            puts "Election Date: ".colorize(:red) + page.css("div.col-7.election-date")[0].text.strip
            puts " "
            puts "------------------------------------------------------------------------------------------"
            puts " "
        end 
        if page.css("div.col-5.special-election-tag")[1] != nil 
            puts "Election Type: ".colorize(:red) + page.css("div.col-5.special-election-tag")[1].text.strip
            puts "Election Date: ".colorize(:red) + page.css("div.col-7.election-date")[1].text.strip
            puts " "       
            puts "------------------------------------------------------------------------------------------"
            puts " "
        end 

        prompt = TTY::Prompt.new(active_color: :red)
        choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
            menu.choice 'Find U.S. Senators and the Congressional Representative for my location', "2"
            menu.choice 'See current headlines in U.S. Politics', "3"
            menu.choice 'See list of upcoming bills for House and Senate', "4"
            menu.choice 'Return to Main Menu', "1"
            menu.choice 'Exit My Congress', "EXIT"
        end 
        
        if choice == '1'
            MyCongress.new.call
        elsif choice == '2'
            puts " "
            puts "Please wait while we locate your congressional district...".colorize(:red)
            GetURL.new(address)
        elsif choice == '3'
            Headlines.new 
        elsif choice == '4'
            Bills.new 
        else
            ProgramEnd.new
        end
    end
end