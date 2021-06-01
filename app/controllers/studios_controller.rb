class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
    @studio_movies = @studio.movies
  end
end
