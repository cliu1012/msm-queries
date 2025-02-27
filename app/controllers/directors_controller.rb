class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")

    # get director info from 'directors' table
    matching_records = Director.where({ :id => the_id }) # returns a relation with all matching rows (should be just one)
    @the_director = matching_records[0] # pull the first (and only) row only in the relation into an array

    # get director's filmography from `movies` table
    @filmography = Movie.where({ :director_id => the_id})

    render({ :template => "director_templates/details" })
  end

  def eldest
    oldest_dob = Director.where.not({ :dob => nil }).minimum(:dob) # returns oldest dob in 'directors' table
    matching_records = Director.where({ :dob => oldest_dob }) # returns relation of all directors with oldest_dob
    @oldest_director = matching_records[0] # would be good to put if condition validating there is only one eldest director

    render({ :template => "director_templates/eldest_director" })
  end

  def youngest
    youngest_dob = Director.where.not({ :dob => nil }).maximum(:dob) # returns most recent dob in 'directors' table
    matching_records = Director.where({ :dob => youngest_dob }) # returns relation of all directors with youngest_dob
    @youngest_director = matching_records[0] # would be good to put if condition validating there is only one youngest director

    render({ :template => "director_templates/youngest_director" })
  end
end
