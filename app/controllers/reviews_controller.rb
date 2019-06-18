class ReviewsController < ApplicationController
  before_action :set_book

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

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

end
