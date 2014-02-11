class ChargesController < ApplicationController

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
