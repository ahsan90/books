class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new
    ContactMailer.new_message(@message).deliver
    redirect_to :back, :notice => "Message was successfully sent."
  end

end

