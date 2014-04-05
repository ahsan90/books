class ContactMailer < ActionMailer::Base
  default from: "contactform@examsuccess.com.au"
  default :to => "success@examsuccess.com.au"

  def new_message(message)
    @message = message
    mail(:subject => "New message from Contact form")
  end

end
