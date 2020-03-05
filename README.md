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
To begin the app will ask if you would like to build your own character or randomly select a preset one. 

  If you choose the preset option it returns a pre-built character. It will then ask if you want to keep it or start over.
  If you choose the build your own character it then asks what you would like your character name to be. 
  After entering your character name it then moves on to selecting race.
  Next is class selection.
  Following those choices you 'roll' for your characters attributes. 
  Once you have your rolled amounts your race bonuses will be added to give you your attribute totals. 

  At the end the app reviews the character you have created and asks if you would like to save it or change anything. 
    If you choose to change something you are given the list of options of what you would like to change. 
    Depending on your choice you will be taken to that area to update your character. 
    If you choose to save your character it will save and ask if you would like to create another character. 
      You can create another new character or exit the app.

