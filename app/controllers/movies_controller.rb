class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :destroy, :edit, :update]

  def index
    @movies = Movie.all
  end

  def show
    @review = Review.new
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if Movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :synopsis, :year)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
