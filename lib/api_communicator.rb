require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  char_hash = get_films_by_char_name(character_name, response_hash)
  film_links_array = get_films_from_char_hash(char_hash)
  film_info = get_film_info(film_links_array)
  # print_movies(film_info)


  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def get_films_by_char_name(name, hash)
  hash["results"].select { |char|
    char["name"] == name
  } 
end

def get_films_from_char_hash(hash)
  hash[0]["films"]
end 

def get_film_info(array)
  array.map { |link|
  turn_url_into_hash(link)
  }
end 

def turn_url_into_hash(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end 

def print_movies(array_of_films)
  array_of_films.map { |film|
  film["title"]
  }
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end