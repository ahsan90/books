class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid? #&& verify_recaptcha(:model => @contact, :message => "Oh! It's error with reCAPTCHA!") 
      ContactMailer.new_message(@contact).deliver
      redirect_to :back, :notice => "Message was successfully sent."
    else
      redirect_to :back, :notice => "Please fill in all fields."
    end
  end

end
