require 'httparty'
require 'pry'

module Wonders
#Starter Code:

  def self.search_wonder(query_array)
    query_array.each do |query|
      encoded_uri = URI.encode("https://maps.googleapis.com/maps/api/place/textsearch/json?key=AIzaSyCPQUkUeS8YNUxAcY7Kclfhp3xwpnXtB2g&query=" + query)


      response = HTTParty.get(encoded_uri).parsed_response

      results = response["results"]


      results.each do |result|
        puts result["name"]
        puts result["geometry"]["location"]
      end

    end
    return nil
  end
end



seven_wonders = ["Great Pyramid of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Pharos of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

puts Wonders.search_wonder(seven_wonders)


#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Pharos of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}
