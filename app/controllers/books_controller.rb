class BooksController < ApplicationController

  def index
    @books = Book.all.order("created_at DESC")
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :summary)
  end
end
