def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end

def get_character_from_user
  puts "Please enter a character name:"
  # use gets to capture the user's input. This method should return that input, downcased.
  return gets.chomp.downcase

end

def get_film_from_user
  puts "Please enter a film name:"
  # use gets to capture the user's input. This method should return that input, downcased.
  return gets.chomp.downcase
end
