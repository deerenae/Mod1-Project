Race.destroy_all
Klass.destroy_all

dragonborn = Race.create(race_name: "Dragonborn", strength: 2, dexterity: 0, constitution: 0,intelligence: 0, wisdom: 0, charisma: 1)
dwarf = Race.create(race_name: "Dwarf", strength: 0, dexterity: 0, constitution: 2,intelligence: 0, wisdom: 0, charisma: 0)
elf = Race.create(race_name: "Elf", strength: 0, dexterity: 2, constitution: 0,intelligence: 0, wisdom: 0, charisma: 0)
gnome = Race.create(race_name: "Gnome", strength: 0, dexterity: 0, constitution: 0,intelligence: 2, wisdom: 0, charisma: 0)
half_elf = Race.create(race_name: "Half-Elf", strength: 0, dexterity: 0, constitution: 0,intelligence: 0, wisdom: 0, charisma: 2)
halfling = Race.create(race_name: "Halfling", strength: 0, dexterity: 2, constitution: 0,intelligence: 0, wisdom: 0, charisma: 0)
halfl_orc = Race.create(race_name: "Half-Orc", strength: 2, dexterity: 0, constitution: 1,intelligence: 0, wisdom: 0, charisma: 0)
human = Race.create(race_name: "Human", strength: 1, dexterity: 1, constitution: 1,intelligence: 1, wisdom: 1, charisma: 1)
tiefling = Race.create(race_name: "Tiefling", strength: 0, dexterity: 0, constitution: 1,intelligence: 1, wisdom: 0, charisma: 2)


barbarian = Klass.create(klass_name: "Barbarian", weapon: "Greataxe", item: "Exporer's pack" )
bard = Klass.create(klass_name: "Bard", weapon: "Lute", item: "Entertainer's pack" )
cleric = Klass.create(klass_name: "Cleric", weapon: "Mace", item: "Priest's pack" )
druid = Klass.create(klass_name: "Druid", weapon: "Scimitar", item: "Explorer's pack" )
fighter = Klass.create(klass_name: "Fighter", weapon: "Longsword", item: "Dungeoneer's pack" )
monk = Klass.create(klass_name: "Monk", weapon: "Shortsword", item: "Dungeoneer's pack" )
palidin = Klass.create(klass_name: "Palidin", weapon: "Polaxe and sheild", item: "Priest's pack" )
ranger = Klass.create(klass_name: "Ranger", weapon: "Longbow", item: "Explorer's pack" )
rogue = Klass.create(klass_name: "Rogue", weapon: "Rapier", item: "Burgler's pack" )
sorcerer = Klass.create(klass_name: "Sorcerer", weapon: "Fire cantrip", item: "Dungeoneer's pack" )
warlock = Klass.create(klass_name: "Warlock", weapon: "Cone of cold", item: "Scholar's pack")
wizard = Klass.create(klass_name: "Wizard", weapon: "Quarterstaff", item: "Scholar's pack")

