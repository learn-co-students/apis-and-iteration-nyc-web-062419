


def welcome
  puts "Welcome! Please select a character from the epic space opera, Star Wars!"
end

def get_character_from_user
  character = gets.chomp 
  character
end

def get_results_array
  i = 1
  final_hash = []
  while i < 10 
    response_string = RestClient.get("https://swapi.co/api/people/?page=#{i}")
    response_hash = JSON.parse(response_string)
    final_hash = final_hash.concat(response_hash["results"])
    i += 1
  end
  final_hash
end
# can be used to parse data from multiple pages

def get_character_movies_from_api(name)
  parsed_data = get_results_array
  films = []
  parsed_data.map do |result_instance|
      if result_instance["name"] == name 
          # puts result_instance["name"]
          films = result_instance["films"]
      end
   end
  film_array = []
  films.map do |film_instance|
    film_data = RestClient.get(film_instance)
    parsed_film = JSON.parse(film_data)
    film_array << parsed_film
  end 
  puts film_array

end 