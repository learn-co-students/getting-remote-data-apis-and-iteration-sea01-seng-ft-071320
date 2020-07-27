def get_character_movies_from_api(character_name)
  #make the web request


  response_string = RestClient.get('http://swapi.dev/api/people')
  response_hash = JSON.parse(response_string)
  # films = [ ]
  films_urls = response_hash["results"].each_with_object([]) {|character, films| 
  # binding.pry
    films << character["films"] if character["name"].include?(character_name)
}.flatten
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  films = films_urls.each_with_object([]) { |film_url, films| 
    # binding.pry
    response_string_film = RestClient.get(film_url)
    response_hash_film = JSON.parse(response_string_film)
    films << response_hash_film
  }
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  # binding.pry
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |film|
    puts "#{film["title"]}"
    puts "#{film["opening_crawl"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
