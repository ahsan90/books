class PurchasesController < ApplicationController
  def index
    authorize! :read, Purchase
  end

  def create
    @saledate = Time.puchase.Book.find(params[:id])
  end
end
