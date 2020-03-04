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
    
    rand_strength = rand(3...19)
    rand_dex = rand(3...19)
    rand_int = rand(3...19)
    rand_wisdom = rand(3...19)
    rand_con = rand(3...19)
    rand_charisma = rand(3...19)

    prompt.say("Time to assign your attributes!")
    prompt.say("You have a #{rand_strength} in strength.")
    prompt.say("You have a #{rand_dex} in dexterity.")
    prompt.say("You have a #{rand_int} in intelligence.")
    prompt.say("You have a #{rand_wisdom} in wisdom.")
    prompt.say("You have a #{rand_con} in constitution.")
    prompt.say("You have a #{rand_charisma} in charisma.")

    prompt.say("And we'll add on your race bonuses...")
    total_strength = race.strength + rand_strength
    total_dex = race.dexterity + rand_dex
    total_int = race.intelligence + rand_int
    total_wisdom = race.wisdom + rand_wisdom
    total_con = race.constitution + rand_con
    total_charisma = race.charisma + rand_charisma

    prompt.say("Hmmm... It seems you have a #{total_strength} in strength.")
    prompt.say("You also have a #{total_dex} in dexterity.")
    prompt.say("Your intelligence is #{total_int}")
    prompt.say("Your wisdom seems to be #{total_wisdom}")
    prompt.say("You can take a hit with a constitution of #{total_con}")
    prompt.say("#{total_charisma} in charisma, eh?")
end