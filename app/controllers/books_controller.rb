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

    if current_user
      @user = current_user
      flash[:notice] = "#{current_user.name} bought #{@book.title}!"
    else
      @temp_password = Devise.friendly_token.first(12)
      @user = User.create(email: params[:stripeEmail], password: @temp_password)
      flash[:notice] = "An email with your ebook is now on its way to you!"
    end

    @referrer = Referrer.find_by_code(session[:referrer])
    Purchase.create(user: @user, book: @book, referrer: @referrer)
    BookMailer.book_purchase(@user, @book, @temp_password).deliver
    redirect_to :back

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :back
  end

end
