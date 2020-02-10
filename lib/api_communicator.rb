require 'rest-client'
require 'json'
require 'pry'
require 'awesome_print'

def translate(url)
  JSON.parse(RestClient.get(url))
end

def peopledata
  url = 'http://www.swapi.co/api/people/'
  return translate(url)
end

def get_character_movies_from_api(character_name)
  #make the web request

  char_info = peopledata["results"].select { |chars| chars["name"].downcase  == character_name }

  film_info = char_info[0]["films"].map { |movies| translate(movies) }
  return film_info
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
  puts "**************************"
  arr = films.map {|data| data["title"]}
  arr.each{|film| 
      puts film 
      puts "**************************" }
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
