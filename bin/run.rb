#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require "pry"
require "json"
require "rest-client"
require "awesome_print"

def run
    welcome
    character_name = get_character_from_user
    # films = get_character_movies_from_api(character_name)
    # print_movies(films)
    show_character_movies(character_name)
end

run