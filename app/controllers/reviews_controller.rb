class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @reviews = Review.all
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
    if @review.save
      redirect_to review_path(@review), notice: '投稿に成功しました！'
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    if @review.user != current_user
      redirect_to reviews_path, alert: '不正なアクセスです！'
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review), notice: '更新に成功しました！'
    else
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :image)
  end

end
