class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(params[:book])
    @book.save
    redirect_to @book
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      flash[:notice] = "Book was updated."
      redirect_to @book
    else
      flash[:error] = "There was an error saving the book. Please try again."
      render :edit
    end
  end

end
