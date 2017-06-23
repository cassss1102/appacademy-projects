class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    # your code here
  end

  def create
    Book.create!(book_params)
    redirect_to "/books"
  end

  def destroy
    Book.find(params[:id]).delete
    redirect_to "/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
