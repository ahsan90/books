class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @message.valid?
      ContactMailer.new_message(@contact).deliver
      redirect_to :back, :notice => "Message was successfully sent."
    else
      flash.now.alert = "Please fill all fields."
      render :new
    end
  end

end
