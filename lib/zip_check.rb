

class ZipCheck

    def initialize(zip)
        if zip.length != 5 || zip.scan(/[0-9]{5}/)[0].length != 5
            puts "Zip Code is Invalid. Press 'Enter' to return to Main Menu.".colorize(:blue)
            nothing = gets.chomp
            MCongress.new.call
        end
    end

end