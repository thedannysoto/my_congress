# require "require_all"
# require_all "lib"
# require 'pry'

class StateCheck

    @@states = {
        "ALABAMA" => "AL",
        "ALASKA" => "AK",
        "ARIZONA" => "AZ",
        "ARKANSAS" => "AR",
        "CALIFORNIA" => "CA",
        "COLORADO" => "CO",
        "CONNETICUT" => "CT",
        "DELAWARE" => "DE",
        "FLORIDA" => "FL",
        "GEORGIA" => "GA",
        "HAWAII" => "HI",
        "IDAHO" => "ID",
        "ILLINOIS" => "IL",
        "INDIANA" => "IN",
        "IOWA" => "IA",
        "KANSAS" => "KS",
        "KENTUCKY" => "KY",
        "LOUISIANA" => "LA",
        "MAINE" => "ME",
        "MARYLAND" => "MD",
        "MASSACHUSETTS" => "MA",
        "MICHIGAN" => "MI",
        "MINNESOTA" => "MN",
        "MISSISSIPPI" => "MS",
        "MISSOURI" => "MO",
        "MONTANA" => "MT",
        "NEBRASKA" => "NE",
        "NEVADA" => "NV",
        "NEW HAMPSHIRE" => "NH",
        "NEW JERSEY" => "NJ",
        "NEW MEXICO" => "NM",
        "NEW YORK" => "NY",
        "NORTH CAROLINA" => "NC",
        "NORTH DAKOTA" => "ND",
        "OHIO" => "OH",
        "OKLAHOMA" => "OK",
        "OREGON" => "OR",
        "PENNSYLVANIA" => "PA",
        "RHODE ISLAND" => "RI",
        "SOUTH CAROLINA" => "SC",
        "SOUTH DAKOTA" => "SD",
        "TENNESSEE" => "TN",
        "TEXAS" => "TX",
        "UTAH" => "UT",
        "VERMONT" => "VT",
        "VIRGINIA" => "VA",
        "WASHINGTON" => "WA",
        "WEST VIRGINIA" => "WV",
        "WISCONSIN" => "WI",
        "WYOMING" => "WY"
    }

    def initialize(state_input)
        if !@@states.keys.include?(state_input.upcase) && !@@states.values.include?(state_input.upcase)
            puts "Invalid State name. Press 'Enter' to return to Main Menu.".colorize(:blue)
            nothing = gets.chomp
            MyCongress.new.call
        elsif @@states.values.include?(state_input.upcase)
            MyCongress.state_input=(@@states.key(state_input.upcase))
            return true
        else
            MyCongress.state_input=(state_input.upcase)
            return true
        end 
    end
end