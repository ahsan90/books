class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    ContactMailer.new_message(@contact).deliver
    redirect_to :back, :notice => "Message was successfully sent."
  end

end
