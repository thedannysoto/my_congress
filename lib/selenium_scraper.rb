class SeleniumScraper

    def initialize(site, address)

        # Launch Chrome behind the scenes & scrape website
        options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
        driver = Selenium::WebDriver.for(:chrome, options: options)
        driver.get(site)

        # grab relevant section from website
        info = driver.find_elements(css: 'div.row.oa-elected-official-group-list-item')

        #Error for not locating address / invalid address
        if info[3] == nil
            puts " "
            prompt = TTY::Prompt.new
            prompt.keypress("Could not find address. Press any key to return to Main Menu.".colorize(:red))
            MCongress.new.call
        end
        
        # Once Selenium passes the refresh, Nokogiri is easier
        # to target the actual elements we need
        elements =  Nokogiri::HTML(open(driver.current_url))

        # Grab two senators and representative
        sen1 = info[3].text.split("\n")
        sen2 = info[4].text.split("\n")
        rep = info[5].text.split("\n")

        driver.quit

        # Sent to FindRepresentatives method to organize info for display
        FindRepresentatives.new(sen1, sen2, rep, elements, address)

    end 
end