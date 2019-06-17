class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
    @book.clubs.new
  end

  def create
    @book = current_user.books.new
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end
  
end
