def welcome
  # puts out a welcome message here!
  puts "Hi there lovely StarWars fan!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_character_choice = gets.chomp.downcase
  user_character_choice
end

