# require 'require_all'
# require_all 'lib'
# require 'pry'


class UpcomingElections

    def initialize(state)
        page = Nokogiri::HTML(open("https://www.vote411.org/#{state.downcase}"))
        Header.new
        puts " "
        puts '"We do not have government by the majority.'
        puts 'We have government by the majority who participate."'
        puts '                                               -Thomas Jefferson'
        puts "------------------------------------------------------------------------------------------"
        puts " "
        puts "Upcoming Elections for #{state.capitalize}: ".colorize(:blue)
        puts " "
        puts "------------------------------------------------------------------------------------------"
        puts " "
        puts "Election Type: ".colorize(:red) + page.css("div.heading").text.strip.split(": ")[1]
        puts "Election Date: ".colorize(:red) + page.css("div.date").text.strip
        puts " "
        puts "------------------------------------------------------------------------------------------"
        puts " "
        puts "Election Type: ".colorize(:red) + page.css("div.col-5.special-election-tag")[0].text.strip
        puts "Election Date: ".colorize(:red) + page.css("div.col-7.election-date")[0].text.strip
        puts " "
        puts "------------------------------------------------------------------------------------------"
        puts " "
        puts "Election Type: ".colorize(:red) + page.css("div.col-5.special-election-tag")[1].text.strip
        puts "Election Date: ".colorize(:red) + page.css("div.col-7.election-date")[1].text.strip
        puts " "       
        puts "------------------------------------------------------------------------------------------"
        puts " "
        puts "Enter '1' to return to Main Menu.".colorize(:blue)
        puts "Enter '2' to find U.S. Senators and the Congressional Representative for your location.".colorize(:blue)
        puts "Type 'exit' to leave My Congress.".colorize(:blue)
        choice = gets.chomp
        if choice != '1' && choice != '2' && choice.upcase != 'EXIT'
            puts "Invalid input. Press 'Enter' to return to Main Menu."
            nothing = gets.chomp
            MyCongress.new.call
        elsif choice == '1'
            MyCongress.new.call
        elsif choice == '2'
            MyCongress.send_to_congress
        else
            ProgramEnd.new
        end
    end
end