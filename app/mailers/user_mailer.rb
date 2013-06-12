class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def result(user)
      @user = user
      @url  = "http://example.com/login"
      mail(:to => user.email, :subject => "The Results are In")
    end
end
