

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

    def initialize(address)
        if !@@states.keys.include?(address[:state].upcase) && !@@states.values.include?(address[:state].upcase)
            puts " "
            puts " "
            prompt = TTY::Prompt.new
            prompt.keypress("Invalid State name. Press any key to return to Main Menu.")
            MCongress.new.call
        elsif @@states.values.include?(address[:state].upcase)
            address[:state] = (@@states.key(address[:state].upcase))
        else
            address[:state] = (address[:state].upcase)
        end 
    end
end