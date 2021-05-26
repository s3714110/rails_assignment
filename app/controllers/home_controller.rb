class HomeController < ApplicationController
  def index
  end

  def help
  end

  def send_email
     @email_visitor = params[:visitor_email]
    unless @email_visitor.blank?
      UserNotifierMailer.send_news_email(@email_visitor).deliver
      redirect_to root_path
    end
  end

end
