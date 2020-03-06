require_relative 'config/environment'
require_relative 'lib/models/cli'
require 'pry'

cli = Cli.new

cli.welcome
system("clear")
cli.name_choice
system("clear")
cli.race_choice
system("clear")
cli.klass_choice
system("clear")
cli.attribute_roller
cli.attribute_adder
system("clear")
cli.character_review
system("clear")