class ReviewsController < ApplicationController
  # before_action :set_book_and_user, only: [:new, :create]
  # before_action :find_review, only: [:edit, :update]
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def edit
  end

  def create
    raise params.inspect
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(review_params)
    redirect_to book_path(@book)
  end

  def update
    if @review.update(review_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @review.destroy

    redirect_to @book
  end

  private

  # def set_book_and_user
  #   @review = Review.new(user_id: current_user, book_id: params[:book_id])
  # end
  #
  # def find_review
  #   @review = Review.find(params[:id])
  # end

  def set_user
    @review.user_id = current_user
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_review
    @review = @book.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :recommend)
  end


end
