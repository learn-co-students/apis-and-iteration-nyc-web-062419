#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require 'json'

# welcome
# character = get_character_from_user
# show_character_movies(character)

require 'rest-client'
character_data = RestClient.get("https://swapi.co/api/people/1")
parsed_data = JSON.parse(character_data)

# puts character_data
# puts parsed_data
# binding.pry
# "This is the end, my friends!"

welcome
character = get_character_from_user
get_character_movies_from_api(character)



