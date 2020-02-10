def welcome
  # puts out a welcome message here!
  puts "Welcome! Bong-Joon Ho won four Oscars last night!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  character = gets.chomp
  return character.downcase
end
