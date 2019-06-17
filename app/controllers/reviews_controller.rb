class ReviewsController < ApplicationController
  # before_action :set_book_and_user, only: [:new, :create]
  # before_action :find_review, only: [:edit, :update]

  def new
    @user = current_user
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)

    if @review.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def set_book_and_user
    @review = Review.new(user_id: current_user, book_id: params[:book_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :recommend)
  end


end
