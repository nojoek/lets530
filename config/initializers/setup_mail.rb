ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "mail.gmail.com",  
  :user_name            => "results.letsdo",  
  :password             => "letsdo2013",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}
 