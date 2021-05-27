class HomeController < ApplicationController
  def index
    @random_product = Product.find(Product.pluck(:id).sample)
    @popular_products = Product.order('popularity DESC, name')
  end

  def help
  end

  def send_email
    @email_visitor = params[:visitor_email]
    unless @email_visitor.blank?
      UserNotifierMailer.send_news_email(@email_visitor).deliver
      flash.now[:notice] = 'Your email has been subscribed!'
    end


    respond_to do |format|
      format.js
    end

  end


  def reset_product
    @current_random_product = Product.find_by_name(params[:random_product_name])
    @current_random_product.popularity += 1
    if @current_random_product.valid?
      @current_random_product.save!
    end

    @random_product = Product.find(Product.pluck(:id).sample)

    respond_to do |format|
      format.js
    end

  end

  def add_to_list
    @current_product = Product.find_by_name(params[:current_product_name])
    @current_product.popularity += 1
    if @current_product.valid?
      @current_product.save!
    end
  end

end
