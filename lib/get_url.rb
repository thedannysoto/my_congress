class GetURL

    def initialize(street, zip, state)
    
    #Turn street string into string to add to URL
    address_array = street.scan(/\w+/)
    address_string = ""
    x = 0
    while x < address_array.length - 1
    address_string += address_array[x] + "%20"
    x += 1
    end
    address_string += address_array[address_array.length-1]
    
    #Add street string + zip to url
    site = "https://secure.everyaction.com/p/VRl-GNlm_0mCSWaMc4d6_w2?pc=#{zip}&add1=#{address_string}&results=True"
    
    #send formatted URL to Selenium
    SeleniumScraper.new(site, state)
    end
end