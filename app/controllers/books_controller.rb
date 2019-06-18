class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    if params[:genre].blank?
      @books = Book.all.order("created_at DESC")
    else
      @genre_id = Genre.find_by(name: params[:genre]).id
      @books = Book.where(:genre_id => @genre_id).order("created_at DESC")
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
    @genres = Genre.all.map{ |g| [g.name, g.id] }
  end

  def create
    @book = current_user.books.build(book_params)
    @book.genre_id = params[:genre_id]

    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @genres = Genre.all.map{ |g| [g.name, g.id] }
  end

  def update
    @book.genre_id = params[:genre_id]

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

  private

  def book_params
    params.require(:book).permit(:title, :author, :summary, :genre_id, :book_image)
  end

  def find_book
    @book = Book.find(params[:id])
  end

end
