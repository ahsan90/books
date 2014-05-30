class LessonMailer < ActionMailer::Base
  default from: "success@examsuccess.com.au"

  def lesson_purchase(user, lesson, temp_password)
    @lesson = lesson
    @email = user.email
    @temp_password = temp_password
    # @name = user.name
    

    # New Headers
    headers["Message-ID"] = "success@examsuccess.com.au"
    headers["In-Reply-To"] = "success@examsuccess.com.au"
    headers["References"] = "success@examsuccess.com.au"

    mail(to: @email, bcc: "success@examsuccess.com.au", subject: "You're confirmed into Exam Success' class: #{lesson.title})!")
  end
end
