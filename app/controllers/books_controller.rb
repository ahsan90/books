class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new(params[:id])
    authorize! :create, Book, message: "You need to be a moderator to create a new book."
  end

  def edit
    @book = Book.find(params[:id])
    authorize! :edit, @book, message: "You need to be a moderator to do that."
  end

  def create
    @book = Book.new(params[:book])
    authorize! :create, @book, message: 'You need to be a moderator to do that.'
    if @book.save
      redirect_to @book
    else
      flash[:error] = "There was an error saving the book. Please try again."
      render :new 
    end
  end

  def update
    @book = Book.find(params[:id])
    authorize! :update, @book, message: "You need to be a moderator to do that."
    if @book.update_attributes(params[:book])
      flash[:notice] = "Book was updated."
      redirect_to @book
    else
      flash[:error] = "There was an error saving the book. Please try again."
      render :edit
    end
  end

  def buy
    @book = Book.find(params[:book_id])

    charge = Stripe::Charge.create(
      card: params[:stripeToken],
      amount: @book.price_in_cents.to_i,
      currency: 'aud',
      description: @book.title
    )

    current_user.books << @book
    flash[:success] = "#{current_user.name} bought #{@book.title}!"
    redirect_to :back

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :back
  end

end
