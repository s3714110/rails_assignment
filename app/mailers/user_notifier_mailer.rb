class UserNotifierMailer < ApplicationMailer
  default :from => 's3714110@student.rmit.edu.au'

  def send_news_email(email)
    mail( :to => email,
    :subject => 'Thanks for subscribing to our store' )
  end
end
