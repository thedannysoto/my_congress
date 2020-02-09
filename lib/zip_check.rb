

class ZipCheck

    def initialize(address)
        if address[:zip].length != 5 || address[:zip].scan(/[0-9]{5}/)[0].length != 5
            puts " "
            puts " "
            prompt = TTY::Prompt.new
            prompt.keypress("Invalid Zip Code. Press any key to return to Main Menu.")
            MCongress.new.call
        end
    end

end