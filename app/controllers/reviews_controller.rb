class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :destroy, :update]
  before_action :find_movie, only: [:create]

  def show
  end

  def destroy
    @review.destroy
    redirect_to movie_path(@review.movie)
  end

  def create
    @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to movie_path(@movie)
    else
      render 'movies/show'
    end
  end

  def update
    if Review.update(review_params)
      redirect_to movie_path(@review.movie)
    else
      render :show
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end
end
