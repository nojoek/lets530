class UserMailer < ActionMailer::Base
  default from: "results.letsdo@gmail.com"
  
  def result(vote)
      @vote = vote
      @url  = "letdo.herokuapp.com/events/#{:event_id}"
      mail(:to => vote.token, :subject => "The Results are In")
    end
end
