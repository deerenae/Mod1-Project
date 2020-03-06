class Cli

    attr_reader :character

    def welcome
        prompt = TTY::Prompt.new
        font = TTY::Font.new(:doom)
        puts font.write ("Welcome, traveler, to the ")
        puts font.write ("D&D Character Creator!")
        response = prompt.select("Do you want to choose from a preset, or build your own character?", %w(Build_my_character Preset), active_color: :green)
        if response == "Preset"
            puts "Please wait while we generate a character..."
            puts ""
            sleep(2)
            0.step(100, 20) do |i|
               printf("\rGenerating: [%-20s]", "*" * (i/5))
               sleep(0.5)
            end
            @character = Character.all.sample
            character_review
            
            system("clear")
        elsif response == "Build_my_character"
            puts "Alright, let's get started then!"
        end
    end

    def name_choice
        prompt = TTY::Prompt.new
        name = prompt.ask("What is your character's name?")
        if name
            puts "Ah, pleased to meet you, #{name}."
            @character = Character.new(name: name)
        else
            prompt.error("You didn't enter a name. Try again.")
            name_choice
        end
    end

    def race_choice        
        prompt = TTY::Prompt.new
        chosen_race = prompt.select("What race is your character?", Race.pluck(:race_name), active_color: :red)
        race = Race.find_by(race_name: chosen_race)
        character.race = race
    end

    def klass_choice
        prompt = TTY::Prompt.new
        chosen_klass = prompt.select("What class are you running?", Klass.pluck(:klass_name), active_color: :blue)
        klass = Klass.find_by(klass_name: chosen_klass)
        puts "Ahh, a #{klass.klass_name}, not a bad choice."
        puts "You are equipped with a #{klass.weapon} and #{klass.item}."
        character.klass = klass
    end
    
    def attribute_roller
        prompt = TTY::Prompt.new
        race = character.race
        
        rand_strength = rand(3...19)
        rand_dex = rand(3...19)
        rand_int = rand(3...19)
        rand_wisdom = rand(3...19)
        rand_con = rand(3...19)
        rand_charisma = rand(3...19)

        prompt.say("Time to assign your attributes!")
        puts ""
        sleep(2)
        0.step(100, 20) do |i|
                printf("\rRolling: [%-20s]", "*" * (i/5))
                sleep(0.5)
        end

        puts ""
        puts ""
        prompt.say("You have a #{rand_strength} in strength,")
        prompt.say("           #{rand_dex} in dexterity,")
        prompt.say("           #{rand_int} in intelligence,")
        prompt.say("           #{rand_wisdom} in wisdom,")
        prompt.say("           #{rand_con} in constitution,")
        prompt.say("       and #{rand_charisma} in charisma.")

        character.strength = rand_strength
        character.dexterity = rand_dex
        character.intelligence = rand_int
        character.wisdom = rand_wisdom
        character.constitution = rand_con
        character.charisma = rand_charisma
    end
       
    def attribute_adder
        prompt = TTY::Prompt.new
        race = character.race
        rand_strength = character.strength
        rand_dex = character.dexterity
        rand_int = character.intelligence
        rand_wisdom = character.wisdom
        rand_con = character.constitution
        rand_charisma = character.charisma

        prompt.say("And we'll add on your race bonuses...")
        puts ""
        sleep(2)
        0.step(100, 20) do |i|
            printf("\rAdding: [%-20s]", "*" * (i/5))
            sleep (0.5)
        end

        total_strength = race.strength + rand_strength
        total_dex = race.dexterity + rand_dex
        total_int = race.intelligence + rand_int
        total_wisdom = race.wisdom + rand_wisdom
        total_con = race.constitution + rand_con
        total_charisma = race.charisma + rand_charisma

        puts ""
        puts ""
        prompt.say("Hmmm... It seems you have a #{total_strength} in strength.")
        prompt.say("You also have a #{total_dex} in dexterity.")
        prompt.say("Your intelligence is #{total_int}.")
        prompt.say("Your wisdom seems to be #{total_wisdom}.")
        prompt.say("You can take a hit with a constitution of #{total_con}.")
        prompt.say("#{total_charisma} in charisma, eh?")

        character.strength = total_strength
        character.dexterity = total_dex
        character.intelligence = total_int
        character.wisdom = total_wisdom
        character.constitution = total_con
        character.charisma = total_charisma

        sleep(6)

    end

    def character_review
        prompt = TTY::Prompt.new
        sleep(1)
        0.step(100, 20) do |i|
            printf("\rGenerating character: [%-10s]", "*" * (i/10))
            sleep (0.5)
        end
        puts ""
        prompt.say("Ok, let's look at what we have...")
        puts ""
        prompt.say("You are #{character.name}, the #{character.race.race_name} known for being a #{character.klass.klass_name}.")
        puts "You have #{character.strength} strength,"
        puts "         #{character.dexterity} dexterity,"
        puts "         #{character.intelligence} intelligence,"
        puts "         #{character.wisdom} wisdom,"
        puts "         #{character.constitution} constitution,"
        puts "     and #{character.charisma} charimsa."
        puts "You are equipped with a #{character.klass.weapon} and #{character.klass.item}."
        puts ""
        answer = prompt.yes?("Is this what you had in mind?")
        if answer == true
            puts "Then join us, #{character.name}. Adventure awaits!"
            character.save
            restart = prompt.yes?("Would you like to create a new character?")
            if restart == true
                welcome
            else
                puts "Thank you for stopping by, traveler."
                sleep(2)
                system("clear")
                exit
            end    
        elsif answer == false
            rework = prompt.select("What would you like to change?", %w(Name Race Class Attributes))
            if rework.downcase == "name"
                name_choice
                character_review
            elsif rework.downcase == "race"
                race_choice
                attribute_adder
                character_review
            elsif rework.downcase == "class"
                klass_choice
                character_review
            elsif rework.downcase == 'attributes'
                attribute_roller
                attribute_adder
                character_review
            end
        end
    end
end