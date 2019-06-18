class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    if params[:genre].blank?
      @books = Book.all.ordered
    else
      # @genre_id = Genre.find_by(name: params[:genre]).id
      # @books = Book.where(genre_id: @genre_id).ordered
      @genre_id = Genre.find_by_name(params[:genre]).id
      @books = Book.by_genre(@genre_id).ordered
    end
  end

  def show
    if @book.reviews.blank?
      @average_review = 0
    else
      @average_review = @book.reviews.average(:rating).round(2)
    end
  end

  def new
    @book = current_user.books.build
    # @genres = Genre.all.map{ |g| [g.name, g.id] }
    map_all_genres
  end

  def create
    @book = current_user.books.build(book_params)
    # @book.genre_id = params[:genre_id]
    set_genre

    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    # @genres = Genre.all.map{ |g| [g.name, g.id] }
    map_all_genres
  end

  def update
    # @book.genre_id = params[:genre_id]
    set_genre

    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end


  def destroy
    @book.destroy
    redirect_to root_path
  end

  def my_books
    @user_id = current_user.id
    # @books = Book.where(user_id: current_user.id).ordered
    @books = Book.my_books(@user_id).ordered
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :summary, :genre_id, :book_image)
  end

  def find_book
    @book = Book.find(params[:id])
  end

  def set_genre
    @book.genre_id = params[:genre_id]
  end

  def map_all_genres
    @genres = Genre.all.map{ |g| [g.name, g.id] }
  end

end
