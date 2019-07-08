require 'rest-client'
require 'json'
require 'pry'

def find_char_by_name(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  #parse request to hash
  response_hash = JSON.parse(response_string)
  #find the character
  character = response_hash["results"].find{|character_hash| character_hash["name"].downcase == character_name}
  character
end

def find_movie_by_name(movie_name) 
  #make the web request
  response_string = RestClient.get('https://www.swapi.co/api/films/')
  #parse request to hash
  response_hash = JSON.parse(response_string)
  #find the film
  film = response_hash["results"].find{|movie_hash| movie_hash["title"].downcase == movie_name}
  film
end

def total_mass_of_cast(film)
  #bring in movie hash
  #grab all char urls
  character_urls = film["characters"]

  mass = character_urls.map do |char_url|
    char_hash = JSON.parse(RestClient.get(char_url))
    char_hash["mass"].to_i
  end.sum
  
  mass

end

def order_films_by_mass
  films_hash = JSON.parse(RestClient.get('https://www.swapi.co/api/films/'))
  films_array = films_hash["results"]
  
  array1 = films_array.map do |film|
    title = film["title"]
    
    mass = total_mass_of_cast(film)
    {title: title, mass: mass}
  end

  array2 = array1.sort_by{|pair| pair[:mass]}
  
  output = array2.map do |name_weight_combo|
    "#{name_weight_combo[:title]} weighs #{name_weight_combo[:mass]}Lbs"
  end

  puts output
end



def get_character_movies_from_api(character_name)
  #call on helper method to find char
  character = find_char_by_name(character_name)
  #grab char films
  char_films = character["films"]
  #storing list of each movies json
  char_film_responses = char_films.collect{|url| JSON.parse(RestClient.get(url))}
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  movie_names = films.map {|film| film["title"]}
  puts movie_names
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
