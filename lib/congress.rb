#require "my/congress/version"
# require 'require_all'
# require_all "lib"
# require 'nokogiri'
# require 'open-uri'
# require 'pry'
# require 'selenium-webdriver'


class MCongress
  

  def call
    Header.new
    HeaderQuote.new
    puts "Welcome to My Congress. Please make a selection from the menu: ".colorize(:red)
    puts " "
    puts "Enter '1' to find U.S. Senators and the Congressional Representative for your location.".colorize(:blue)
    puts "Enter '2' to see upcoming elections for your location.".colorize(:blue)
    puts "Type 'exit' to leave My Congress.".colorize(:blue)
    choice = gets.chomp 
    if choice != "1" && choice != "2" && choice.upcase != "EXIT"
      puts "Invalid input. Press 'Enter to return to Main Menu.".colorize(:blue)
      nothing = gets.chomp
      MCongress.new.call
    elsif choice.upcase == "EXIT"
      ProgramEnd.new
    end
    puts "Enter the name of your city: ".colorize(:blue)
    @city_input = gets.chomp
    puts "Enter the name of your state: ".colorize(:blue)
    @state_input = gets.chomp
    StateCheck.new(@state_input)
    puts "Enter your 5 digit zip code: ".colorize(:blue)
    @@zip_input = gets.chomp
    ZipCheck.new(@@zip_input)
    puts "Enter your street number and name: ".colorize(:blue)
    @@street_input = gets.chomp
    if choice == "1"
      puts " "
      puts "Please wait while we locate your congressional district...".colorize(:red)
      GetURL.new(@@street_input, @@zip_input, @@state_input)
    else
      UpcomingElections.new(@@state_input)
    end
  end

  #Sends user to Senators/Representative method from Upcoming Elections method
  def self.send_to_congress
    puts " "
    puts "Please wait while we locate your congressional district...".colorize(:red)
    GetURL.new(@@street_input, @@zip_input, @@state_input)
  end

  def self.state_input
    @@state_input
  end

  def self.state_input=(input)
    @@state_input = input
  end

  def self.get_url(street, zip)
    address_array = street.scan(/\w+/)
    address_string = ""
    x = 0
    
    while x < address_array.length - 1
    address_string += address_array[x] + "%20"
    x += 1
    end
    
    address_string += address_array[address_array.length-1]
    
    site = "https://secure.everyaction.com/p/VRl-GNlm_0mCSWaMc4d6_w2?pc=#{zip}&add1=#{address_string}&results=True"
    MCongress.selenium(site)
  
  end

  def self.selenium(site)
    options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    driver = Selenium::WebDriver.for(:chrome, options: options)
    driver.get(site)

    
    info = driver.find_elements(css: 'div.row.oa-elected-official-group-list-item')

    #Error for not locating address / invalid address
    if info[3] == nil
      puts " "
      puts "Could not locate address. Press 'Enter' to return to Main Menu.".colorize(:blue)
      nothing = gets.chomp
      MCongress.new.call
    end
    elements =  Nokogiri::HTML(open(driver.current_url))

    sen1 = info[3].text.split("\n")
    sen2 = info[4].text.split("\n")
    rep = info[5].text.split("\n")

    driver.quit

    MCongress.find_representatives(sen1, sen2, rep, elements)

  end 


  def self.find_representatives(sen1, sen2, rep, elements)
    @district = rep[2].scan(/\d/)[0]
    senator1 = {}
    senator2 = {}
    representative = {}
    congress_members = [senator1, senator2, representative]
    info_array = [sen1, sen2, rep]

    x = 0
    congress_members.each do |member|
      member[:name] = info_array[x][0].strip
      member[:party] = info_array[x][1].scan(/.[RD]\W/)[0]
        if member[:party] == "(R)"
          member[:party] = "Republican"
        else
          member[:party] = "Democrat"
        end
      member[:phone] = info_array[x][3].strip
      member[:twitter] = elements.css("div.oa-eo-target-col-links")[x+3].children[1].attributes["href"].value
      member[:facebook] = elements.css("div.oa-eo-target-col-links")[x+3].children[3].attributes["href"].value
      member[:website] = elements.css("div.oa-eo-target-col-links")[x+3].children[5].attributes["href"].value
      x += 1
    end
    
    CongressOutput.new(senator1, senator2, representative, @district, @@state_input)


  end

end 