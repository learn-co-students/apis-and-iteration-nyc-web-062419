require 'rest-client'
require 'json'
require 'pry'

def connect_to_people_api
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  character_films = response_hash["results"].find {|character| character["name"] == character_name}["films"]
  character_films.map do |api_link|
    response_string = RestClient.get(api_link)
    response_hash = JSON.parse(response_string)
  end
end

def print_movies(films)
  films.each_with_index do |film, index|
    puts "#{index + 1}.#{film["title"]}"
  end
  nil
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
