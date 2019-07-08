require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  response_hash = JSON.parse(RestClient.get('http://www.swapi.co/api/people/'))
  response_hash["results"].map do |results|
    if results["name"].downcase == character_name.downcase
      results["films"]
    end
  end.flatten.compact
end

def print_movies(film_urls)
  results = film_urls.map {|url| string = RestClient.get("#{url}") ; 
  JSON.parse(string)}.map do |string| 
    string["title"]
  end
  puts results
end

def show_character_movies(character_name)
  film_urls = get_character_movies_from_api(character_name)
  print_movies(film_urls)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

