require 'rest-client'
require 'json'
require 'pry'

def get_api_hash(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character_name)
  #make the web request
  swapi = 'http://www.swapi.co/api/people/'
  character_list = get_api_hash(swapi)
  characters = character_list["results"]

  
  movies = characters.collect do |movie|
     movie["films"] if movie["name"].downcase == character_name
  end.reject {|wut| wut == nil}.flatten
  binding.pry
  
  


  movie_aoh = []
  movies.each do |movie|
    hash = get_api_hash(movie)
    movie_aoh << hash
  end

  return movie_aoh

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

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  
  films.map do |film|
    puts "*************\n #{film["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
