class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
    @studio_movies = @studio.movies
    @movie_actors = Studio.actors_list
  end
end
