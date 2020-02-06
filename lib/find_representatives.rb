class FindRepresentatives

    def initialize(sen1, sen2, rep, elements, state)
        # Grab district number for Representative display
        @district = rep[2].scan(/\d/)[0]
        
        # create hashes for each senator and representative
        senator1 = {}
        senator2 = {}
        representative = {}
        congress_members = [senator1, senator2, representative]
        info_array = [sen1, sen2, rep]

        # extract info from scraped elements and organize into hashes
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
    
        # Send organized hashes, district, and state to 
        # CongressOutput method for output
        CongressOutput.new(senator1, senator2, representative, @district, state)



    end
end