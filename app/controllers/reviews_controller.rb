class ReviewsController < ApplicationController
  before_action :set_book, except: [:my_reviews]
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    #fix association prob here
    @review.book_id = @book.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to book_path(@book)
    else
      render 'new'
    end

  end

  def edit
  end

  def update

    if @review.update(review_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy

    redirect_to book_path(@book)
  end

  def my_reviews
    @user_id = current_user.id
    @reviews = Review.where(user_id: current_user.id)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_review
    @review = @book.reviews.find(params[:id])
  end

end
