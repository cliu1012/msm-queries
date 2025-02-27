class ActorsController < ApplicationController
  def index
    render({ :template => "actor_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")

    # get actor info from 'actors' table
    matching_records = Actor.where({ :id => the_id }) # pull relation with all matches (should be one)
    @the_actor = matching_records[0] # pull the first (and only) row from the matching_record relations into an array

    # get the actor's character_list from the 'characters' table
    character_list = Character.where({ :actor_id => the_id }) # relation of all the characters the actor has 
    
    @actor_filmography = Array.new # array of hashes to hold all pertinent info for /actors/:id web page

    character_list.each do |the_character|
      # get the movie row
      the_movie = Movie.where({ :id => the_character.movie_id })[0]
      # get the movie id
      movie_id = the_movie.id
      # get movie title
      movie_title = the_movie.title
      # get movie year
      movie_year = the_movie.year
      # get movie director name
      director_name = Director.where({ :id => the_movie.director_id })[0].name
      # get character name
      character_name = the_character.name
      
      # push all of this information into a hash
      filmography_hash = { :movie_title => movie_title, :movie_year => movie_year, :director => director_name, :character => character_name, :movie_id => movie_id }

      # push all of this information into the actor_filmography array
      @actor_filmography.push(filmography_hash)
    end



    render({ :template => "actor_templates/details" })
  end
end
