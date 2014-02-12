class BookMailer < ActionMailer::Base
  default from: "success@examsuccess.com.au"

  def book_purchase(user, book)
    @book = book
    @email = user.email
    # @name = user.name
    

    # New Headers
    headers["Message-ID"] = "success@examsuccess.com.au"
    headers["In-Reply-To"] = "success@examsuccess.com.au"
    headers["References"] = "success@examsuccess.com.au"

    mail(to: @email, subject: "Your Exam Success Order (#{book.title}) is here!")
  end

end
