class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      ContactMailer.new_message(@contact).deliver
      redirect_to :back, :notice => "Message was successfully sent."
    else
      redirect_to :back, :warning => "Please fill in all fields."
      render :new
    end
  end

end
