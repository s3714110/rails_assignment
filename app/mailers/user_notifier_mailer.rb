class UserNotifierMailer < ApplicationMailer
  default :from => 'lamtran1030@gmail.com'

  def send_news_email(email)
    mail( :to => email,
    :subject => 'Thanks for subscribing to our store' )
  end
end
