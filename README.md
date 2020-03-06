# D&D Character Creator
This CLI app will guide a user through the process of creating a basic, fifth edition Dungeons and Dragons character.

## Motivation
We wanted to be able to help newer Dungeons and Dragons players build a character to use for their campaign.

## Features
This app has the ability to create a new character or request a preset character. If the user chooses to build their own character they make their character name then they have 9 races and 12 classes to choose from. After that they 'roll' for their player attributes. 


## Installation
To begin you will want to fork and clone from the project page

Then the following commands in the terminal
```
  rake db:migrate
```
```
  rake db:seed
```
```
  bundle install  
```

## How to use?
### To begin
The app will ask if you would like to build your own character or randomly select a preset one. 

#### Choose a preset
Selecting the preset character option will give you a character that has everything already built. 

#### Build your own character 
The first thing you enter is your character's name.
Next you have 9 different races to choose from.
After that you have 12 different classes to choose from. 
Once you have selected race and classes you 'roll' for your character attributes.
Once you have your rolled amounts your race bonuses will be added to give you your attribute totals. 

### Character review
At the end the app reviews the character you have created and asks if you would like to save it or change anything.

#### Updating character
If you choose to change something you are given the list of options of what you would like to change. 
  Depending on your choice you will be taken to that area to update your character. 

#### Saveing character
If you choose to save your character it will save and ask if you would like to create another character. 
  You can create another new character or exit the app.

