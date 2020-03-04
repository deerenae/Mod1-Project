require_relative 'config/environment'

prompt = TTY::Prompt.new

puts "Welcome, traveler, to the D&D Character Creator!"
response = prompt.select("Do you want to choose from a preset, or build your own character?", %w(Build_my_character Preset))
if response == "Preset"
    puts "Please wait while we generate a character..."
elsif response == "Build_my_character"
    puts "Alright, let's get started then!"
    name = prompt.ask("What is your character's name?")
    puts "Ah, #{name}, a fine choice."
end
