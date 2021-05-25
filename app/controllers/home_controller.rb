class HomeController < ApplicationController
  def index
    @email_visitor = params[:visitor_email]
    unless @email_visitor.blank?
      UserNotifierMailer.send_news_email(@email_visitor).deliver
    end
  end

end
