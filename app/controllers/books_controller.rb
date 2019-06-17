class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    find_book
  end

  def new
    @book = current_user.books.build
    @user = current_user
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to user_book_path(current_user, @book), notice: "Succesfully created book!"
    else
      render 'new'
    end
  end

  def edit
    find_book
  end

  def update
    find_book
    if @book.update(book_params)
      redirect_to user_book_path(current_user, @book), notice: "Succesfully updated book!"
    else
      render 'edit'
    end
  end

  def destroy
    find_book.destroy
    redirect_to books_path, notice: "Succesfully deleted book!"

  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :genre, :author, :summary)
  end

end
