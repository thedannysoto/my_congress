class GetURL

    def initialize(address)
    
    #Turn street address into string formatted for URL
    address_array = address[:street].scan(/\w+/)
    address_string = ""
    x = 0
    while x < address_array.length - 1
    address_string += address_array[x] + "%20"
    x += 1
    end
    address_string += address_array[address_array.length-1]
    
    #Add street string + zip to url
    site = "https://secure.everyaction.com/p/VRl-GNlm_0mCSWaMc4d6_w2?pc=#{address[:zip]}&add1=#{address_string}&results=True"
    
    #send formatted URL to Selenium
    SeleniumScraper.new(site, address)
    end
end