#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
puts "Movies:"
show_character_movies(character)
#
#
puts "\nVehicles:"
show_vehicles_ridden(character)
