class UserMailer < ActionMailer::Base
  default from: "results.letsdo.gmail.com"
  
  def result(vote)
      @vote = vote
      @url  = "http://example.com/login"
      mail(:to => vote.token, :subject => "The Results are In")
    end
end
