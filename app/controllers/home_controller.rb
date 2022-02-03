class HomeController < ApplicationController

  def index
    @random_product = Product.find(Product.pluck(:id).sample)
    @popular_products = Product.order('popularity DESC, name')
    if !cookies[:saved].present?
      cookies.permanent[:saved] = JSON.generate([])
    end
    @categories = Category.all
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
    if !cookies[:saved].present?
      cookies.permanent[:saved] = JSON.generate([])
    end

    @current_random_product = Product.find_by_name(params[:random_product_name])
    @current_saved_list = JSON.parse(cookies[:saved])

    if @current_saved_list.include?(@current_random_product.id)
      @current_saved_list.delete(@current_random_product.id)
    else
      @current_saved_list.push(@current_random_product.id)
      @current_random_product.popularity += 1
      if @current_random_product.valid?
        @current_random_product.save!
      end
    end

    cookies.permanent[:saved] = JSON.generate(@current_saved_list)

    if logged_in?
     Savelist.find_by(user_id: current_user.id).update_attribute(:list, JSON.generate(@current_saved_list))
    end

    @random_product = Product.find(Product.pluck(:id).sample)

    respond_to do |format|
      format.js
    end

  end

  def add_to_list
    if !cookies[:saved].present?
      cookies.permanent[:saved] = JSON.generate([])
    end

    @current_product = Product.find_by_name(params[:current_product_name])
    @current_saved_list = JSON.parse(cookies[:saved])

    if @current_saved_list.include?(@current_product.id)
      @current_saved_list.delete(@current_product.id)
    else
      @current_saved_list.push(@current_product.id)
      @current_product.popularity += 1
      if @current_product.valid?
        @current_product.save!
      end

    end

    cookies.permanent[:saved] = JSON.generate(@current_saved_list)
    if logged_in?
     Savelist.find_by(user_id: current_user.id).update_attribute(:list, JSON.generate(@current_saved_list))
    end

    @popular_products = Product.order('popularity DESC, name')

    respond_to do |format|
      format.js
    end

  end

  def saved
    if !cookies[:saved].present?
      cookies.permanent[:saved] = JSON.generate([])
    end

    @saved_products = JSON.parse(cookies[:saved])

  end

  def saved_to_list

    @current_saved_product = Product.find_by_name(params[:current_saved_product_name])
    @current_saved_list = JSON.parse(cookies[:saved])

    if @current_saved_list.include?(@current_saved_product.id)
      @current_saved_list.delete(@current_saved_product.id)
    else
      @current_saved_list.push(@current_saved_product.id)
      @current_saved_product.popularity += 1
      if @current_saved_product.valid?
        @current_saved_product.save!
      end

    end

    cookies.permanent[:saved] = JSON.generate(@current_saved_list)
    if logged_in?
     Savelist.find_by(user_id: current_user.id).update_attribute(:list, JSON.generate(@current_saved_list))
    end
    @saved_products = JSON.parse(cookies[:saved])

    respond_to do |format|
      format.js
    end


  end

  def collection_all
    if !cookies[:saved].present?
      cookies.permanent[:saved] = JSON.generate([])
    end

    @all_products = Product.order('name')
  end


  def saved_from_collection

    @current_saved_product = Product.find_by_name(params[:current_saved_product_name])
    @current_saved_list = JSON.parse(cookies[:saved])

    if @current_saved_list.include?(@current_saved_product.id)
      @current_saved_list.delete(@current_saved_product.id)
    else
      @current_saved_list.push(@current_saved_product.id)
      @current_saved_product.popularity += 1
      if @current_saved_product.valid?
        @current_saved_product.save!
      end

    end

    cookies.permanent[:saved] = JSON.generate(@current_saved_list)
    if logged_in?
     Savelist.find_by(user_id: current_user.id).update_attribute(:list, JSON.generate(@current_saved_list))
    end
    @all_products = Product.order('name')
    respond_to do |format|
      format.js
    end

  end

  def search
    if !params[:search_param].nil?
      @parameter = params[:search_param].downcase
      @all_products = Product.all.where('lower(name) LIKE ?', "%#{@parameter}%" ).order('name')
    end
  end

  def filter

    @products = Product.all
    @tag_products = TagProduct.all.where(:tag_id => params[:tag])

    @products = Product.all.where(:product_id =>  @tag_products.map(&:product_id) )

  end


end
