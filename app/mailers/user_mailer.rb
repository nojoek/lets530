class UserMailer < ActionMailer::Base
  default from: "results.letsdo@gmail.com"
  
  def results(vote)
      @vote = vote
      @slug = @vote.event_id
      @url  = "letdo.herokuapp.com/events/#{:slug}"
      mail(:to => vote.token, :subject => "The Results are In")
    end
end
