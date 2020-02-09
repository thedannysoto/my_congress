class Headlines

    def initialize
        #Get HTML for page with headlines
        page = Nokogiri::HTML(open('https://knewz.com/topics/politics/'))
        
        headline_array = []

        x = 0
        y = 1

        # make hashes of each article and add to headline_array
        page.css("h2").each do |title|
            articles = { }
            articles[:title] = title.text
            articles[:url] = page.css("a.document-title")[x].attributes["href"].value
            articles[:blurb] = page.css("a.document-title span")[y].children[0].text
            
            headline_array << articles
            
            x += 4
            y += 8
        end

        headline_output_1(headline_array)
    end

    def headline_output_1(headline_array)
        system "clear"
        puts " "
        puts "Current Headlines in U.S. Politics".colorize(:blue)
        puts " "
        puts "------------------------------------------------------------------------------------------"

        x = 0
        while x < 4
            puts "#{headline_array[x][:title].upcase}".colorize(:red)
            puts " "
            puts "  #{headline_array[x][:blurb]}"
            puts " "
            puts "  Source: " + "#{headline_array[x][:url]}".colorize(:blue)
            puts "------------------------------------------------------------------------------------------"
            x += 1
        end

        puts " "
        puts " "
        prompt = TTY::Prompt.new(active_color: :red)
        choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
            menu.choice 'Show more headlines', "1"
            menu.choice 'See list of upcoming bills for House and Senate', "2"
            menu.choice 'Return to Main Menu', "3"
            menu.choice 'Exit My Congress', "EXIT"
        end 

        if choice == "EXIT"
            ProgramEnd.new
        elsif choice == "2"
            Bills.new
        elsif choice == "3"
            MyCongress.new.call
        else 
            headline_output_2(headline_array)
        end
    end

    def headline_output_2(headline_array)
        system "clear"
        puts " "
        puts "Current Headlines in U.S. Politics".colorize(:blue)
        puts " "
        puts "------------------------------------------------------------------------------------------"

        x = 4
        while x < 8
            puts "#{headline_array[x][:title].upcase}".colorize(:red)
            puts " "
            puts "  #{headline_array[x][:blurb]}"
            puts " "
            puts "  Source: " + "#{headline_array[x][:url]}".colorize(:blue)
            puts "------------------------------------------------------------------------------------------"
            x += 1
        end

        puts " "
        puts " "
        prompt = TTY::Prompt.new(active_color: :red)
        choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
            menu.choice 'Show more headlines', "1"
            menu.choice 'Return to Main Menu', "2"
            menu.choice 'Exit My Congress', "EXIT"
        end 

        if choice == "EXIT"
            ProgramEnd.new
        elsif choice == "2"
            MyCongress.new.call
        else 
            headline_output_3(headline_array)
        end
    end

    def headline_output_3(headline_array)
        system "clear"
        puts " "
        puts "Current Headlines in U.S. Politics".colorize(:blue)
        puts " "
        puts "------------------------------------------------------------------------------------------"

        x = 8
        while x < 11 && headline_array[x] != nil
            puts "#{headline_array[x][:title].upcase}".colorize(:red)
            puts " "
            puts "  #{headline_array[x][:blurb]}"
            puts " "
            puts "  Source: " + "#{headline_array[x][:url]}".colorize(:blue)
            puts "------------------------------------------------------------------------------------------"
            x += 1
        end

        puts " "
        puts " "
        prompt = TTY::Prompt.new(active_color: :red)
        choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
            menu.choice 'Return to Main Menu', "1"
            menu.choice 'Exit My Congress', "EXIT"
        end 

        if choice == "EXIT"
            ProgramEnd.new
        else
            MyCongress.new.call
        end
    end
end
 