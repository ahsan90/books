class BookMailer < ActionMailer::Base
  default from: "success@examsuccess.com.au"

  def book_purchase(user, book, temp_password)
    @book = book
    @email = user.email
    @temp_password = temp_password
    # @name = user.name
    

    # New Headers
    headers["Message-ID"] = "success@examsuccess.com.au"
    headers["In-Reply-To"] = "success@examsuccess.com.au"
    headers["References"] = "success@examsuccess.com.au"

    mail(to: @email, bcc: "success@examsuccess.com.au", subject: "Your Exam Success Order (#{book.title}) is here!")
  end

end
