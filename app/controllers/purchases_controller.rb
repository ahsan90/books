class PurchasesController < ApplicationController
  def index
    authorize! :read, Purchase
  end

end
