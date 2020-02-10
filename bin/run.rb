#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require "pry"
require "json"
require "rest-client"
require "awesome_print"

def run
    welcome
    character = get_character_from_user
    show_character_movies(character)
end

run