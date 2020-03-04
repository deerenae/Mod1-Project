require_relative 'config/environment'
require 'pry'

prompt = TTY::Prompt.new

def name_choice
    prompt2 = TTY::Prompt.new
    name = prompt2.ask("What is your character's name?")
    if name
        puts "Ah, #{name}, a fine choice."
    else
        prompt2.error("You didn't enter a name. Try again.")
        name_choice
    end
end

puts "Welcome, traveler, to the D&D Character Creator!"
response = prompt.select("Do you want to choose from a preset, or build your own character?", %w(Build_my_character Preset), active_color: :green)
if response == "Preset"
    puts "Please wait while we generate a character..."
elsif response == "Build_my_character"
    puts "Alright, let's get started then!"

    name_choice
    binding.pry
    chosen_race = prompt.select("What race is your character?", Race.pluck(:race_name), active_color: :red)
    race = Race.find_by(race_name: chosen_race)

    chosen_klass = prompt.select("What class are you running?", Klass.pluck(:klass_name), active_color: :blue)
    klass = Klass.find_by(klass_name: chosen_klass)
    
    strength = rand(3...19)
    dex = rand(3...19)
    int = rand(3...19)
    wisdom = rand(3...19)
    con = rand(3...19)
    charisma = rand(3...19)

    prompt.say("Time to assign your attributes!")
    prompt.say("Hmmm... It seems you have a #{strength} in strength.")
    prompt.say("You also have a #{dex} in dexterity.")
    prompt.say("Your intelligence is #{int}")
    prompt.say("Your wisdom seems to be #{wisdom}")
    prompt.say("You can take a hit with a constitution of #{con}")
    prompt.say("#{charisma} in charisma, eh?")

end