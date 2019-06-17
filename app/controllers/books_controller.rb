class BooksController < ApplicationController
  before_action :find_book

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      @book.reviews.create(user_id: current_user.id)
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :genre, :author, :summary)
  end

end
