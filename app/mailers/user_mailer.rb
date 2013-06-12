class UserMailer < ActionMailer::Base
  default from: "from@example.com"


  def results(user)
      @name = user.email

      mail to: user.email, subject: "The Results are In!"
    end
end