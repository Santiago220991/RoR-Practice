class BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      render json: book
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find_by(id: params[:id])
  
    if book
      book.destroy
      render json: { message: "Book deleted successfully" }, status: :ok
    else
      render json: { error: "Book not found" }, status: :not_found
    end
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end