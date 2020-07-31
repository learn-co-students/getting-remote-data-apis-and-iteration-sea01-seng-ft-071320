def welcome
  puts 'Welcome to the Star Wars API Command Line Interface!'
end

def get_character_from_user
  puts "please enter a character name"
  gets.chomp.downcase
end