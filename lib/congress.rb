class MyCongress

  def call
    Header.new
    HeaderQuote.new
    puts "Welcome to My Congress!" 
    puts " "
    prompt = TTY::Prompt.new(active_color: :red)
    choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
      menu.choice 'Find U.S. Senators and the Congressional Representative for my location', "1"
      menu.choice 'See upcoming elections in my area', "2"
      menu.choice 'See current headlines in U.S. Politcs', "3"
      menu.choice 'See list of upcoming bills for House and Senate', "4"
      menu.choice 'Exit My Congress', "EXIT"
    end 
  
    if choice == "EXIT"
      ProgramEnd.new
    elsif choice == "3"
      Headlines.new
    elsif choice == "4"
      Bills.new
    end 

    address = prompt.collect do
      key(:city).ask("Enter the name of your city: ")
      key(:state).ask("Enter the name of your state: ")
      key(:zip).ask("Enter your zip code :")
      key(:street).ask("Enter your street number and street name :")
    end
    
    StateCheck.new(address)
    ZipCheck.new(address)

    if choice == "1"
      puts " "
      puts "Please wait while we locate your congressional district...".colorize(:red)
      GetURL.new(address)
    else
      UpcomingElections.new(address)
    end
  end
end 