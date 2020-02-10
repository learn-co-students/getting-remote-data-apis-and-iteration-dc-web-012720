require 'rest-client'
require 'json'
require 'pry'

SWAPI = 'http://www.swapi.co/api/people/'

def get_api_hash(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def get_info_from_api(character_name, type_info)
  #make the web request
  character_list = get_api_hash(SWAPI)
  characters = character_list["results"]

  
  array = characters.collect do |elem|
     elem[type_info] if elem["name"].downcase == character_name
  end.reject {|wut| wut == nil}.flatten
  
  


  aoh = []
  array.each do |h|
    hash = get_api_hash(h)
    aoh << hash
  end

  return aoh

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_name(aoh, string)
  # some iteration magic and puts out the movies in a nice list
  
  aoh.map do |hash|
    puts "*************\n #{hash[string]}"
  end
end

def show_character_movies(character)
  films = get_info_from_api(character, "films")
  print_name(films, "title")
end

#
#
#bonus stuff
#
#
# def get_character_vehicles_from_api(character_name)
#   character_list = get_api_hash(SWAPI)
#   characters = character_list["results"]

#   vehicles = characters.collect do |character|
#     character["vehicles"] if character["name"].downcase == character_name
#   end.reject {|wut| wut == nil}.flatten

#   vehicle_aoh = []
#   vehicles.each do |ride|
#     hash = get_api_hash(ride)
#     vehicle_aoh << hash
#   end

#   vehicle_aoh
# end


def show_vehicles_ridden(character)
  vehicles = get_info_from_api(character, "vehicles")
  print_name(vehicles, "name")
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
