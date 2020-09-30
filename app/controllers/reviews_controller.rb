class ReviewsController < ApplicationController
  def index
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to review_path(@review)
  end

  def edit
    @review = Review.find(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :image)
  end

end
