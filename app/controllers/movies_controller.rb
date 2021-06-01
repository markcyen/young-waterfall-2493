class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @all_actors = Actor.all
binding.pry
    if params[:actor_name]
      @actors << Actor.find(params[:actor_name])
    end
  end
end
