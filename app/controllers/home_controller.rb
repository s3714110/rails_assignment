class HomeController < ApplicationController
  def index
    @random_product = Product.find(Product.pluck(:id).sample)
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

  def reset_product
    @random_product = Product.find(Product.pluck(:id).sample)

    respond_to do |format|
      format.js
    end

  end

end
