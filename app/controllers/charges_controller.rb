class ChargesController < ApplicationController

  def new
  end

  def create
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    
    @amount = @book.price_in_cents

    #customer = Stripe::Customer.create(
    #  :email => @user.email,
    #  :card => params[:stripeToken]
     # )

    charge = Stripe::Charge.create(
      :card => params[:stripeToken],
      :amount => @amount,
      :description => @book.title,
      :currency => 'aud' 
      )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
