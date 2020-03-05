require_relative 'config/environment'
require_relative 'lib/models/cli'
require 'pry'

cli = Cli.new

cli.welcome
cli.name_choice
cli.race_choice
cli.klass_choice
cli.attribute_roller
cli.attribute_adder
cli.character_review