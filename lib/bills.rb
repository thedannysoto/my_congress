class Bills

    def initialize

        page = Nokogiri::HTML(open('https://www.govtrack.us/congress/bills/'))
      
        bill_array = []
        bills = page.css("table.table tr")
        bill_each = page.css("table.table tr td")
        x = 3
        while x < (4 + (bills.length - 1) * 4) 
            bill_hash = {  }
            bill_hash[:name] = bill_each[x].css("a").children.text
            bill_hash[:congress] = bill_each[x-1].css("div").children.children.text
            bill_hash[:bill_url] = bill_each[x].css("a")[0].attributes["href"].value                
            bill_hash[:bill_page] = Nokogiri::HTML(open("https://www.govtrack.us#{bill_hash[:bill_url]}"))
            bill_hash[:bill_sponsor] = bill_hash[:bill_page].css("a.name").children.text
            bill_hash[:bill_sponsor_info] = bill_hash[:bill_page].css("div.col-xs-7 p").children.text.split(". ")
            bill_hash[:bill_summary] = Nokogiri::HTML(open("https://www.govtrack.us#{bill_hash[:bill_url]}/summary"))
            bill_hash[:bill_summary_paragraphs] = bill_hash[:bill_summary].css("div#libraryofcongress p")
            bill_array << bill_hash
            x += 4
        end  
         
        bill_output(bill_array)
    end
    
    def bill_output(bill_array)
        system "clear"
        puts " "
        puts " "
        puts "#{bill_array.length} bills and resolutions that are on the House and Senate calendars for the coming days: ".colorize(:blue)
        puts " "
        puts "------------------------------------------------------------------------------------------"
        puts " "
        bill_array.each do |bill|
            if !bill.empty? || bill != nil 
            puts "#{bill[:congress]} Bill: #{bill[:name]}".colorize(:red)
            puts "Bill Sponsor: " + "#{bill[:bill_sponsor]}, #{bill[:bill_sponsor_info][1]}, #{bill[:bill_sponsor_info][2]}"
            puts " "
            puts "------------------------------------------------------------------------------------------"
            puts " "
            end 
        end

        prompt = TTY::Prompt.new(active_color: :red)
        choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
            menu.choice 'Read summary of bills', "1"
            menu.choice 'See current headlines in U.S. Politcs', "2"
            menu.choice 'Return to Main Menu', "3"
            menu.choice 'Exit My Congress', "EXIT"
        end 

        if choice == '2'
            Headlines.new
        elsif choice == '3'
            MyCongress.new.call
        elsif choice == 'EXIT'
            ProgramEnd.new
        else
            prompt = TTY::Prompt.new(active_color: :red)
            num = prompt.select("Please choose one of the bills:".colorize(:blue)) do |menu|
                x = 0
                while x < bill_array.length
                    menu.choice "#{x+1}", "#{x}"
                    x += 1
                end
            end
            bill_summary(bill_array, num)
        end

    end

    def bill_summary(bill_array, choice)
        Header.new
        puts " "
        puts "#{bill_array[choice.to_i][:name]}".colorize(:red)
        puts "------------------------------------------------------------------------------------------"
        puts " "
        bill_array[choice.to_i][:bill_summary_paragraphs].each do |paragraph|
            puts paragraph.text
            puts " "
        end

        prompt = TTY::Prompt.new(active_color: :red)
        choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
            menu.choice 'See list of upcoming bills for House and Senate', "1"
            menu.choice 'See current headlines in U.S. Politcs', "2"
            menu.choice 'Return to Main Menu', "3"
            menu.choice 'Exit My Congress', "EXIT"
        end 

        if choice == "1"
            bill_output(bill_array)
        elsif choice == "2"
            Headlines.new 
        elsif choice == "3"
            MyCongress.new.call
        else  
            ProgramEnd.new
        end

    end
end