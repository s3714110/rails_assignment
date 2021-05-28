class UsersController < ApplicationController
  before_action :logged_in, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:show, :edit, :update]
  layout 'home'

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome "  + @user.name + " !"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attribute(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def addcart

    if !logged_in?
      cookies.delete :cart_temp
      temp_array = [];
      temp_array.push(params[:product_id])
      temp_array.push(params[:size])
      temp_array.push(params[:color])
      temp_array.push(params[:qty])
      cookies.permanent[:cart_temp] = JSON.generate(temp_array)
      redirect_to login_url

    else
      if cookies[:cart_temp].present?
        temp_cart = JSON.parse(cookies[:cart_temp])
        @product_id = temp_cart[0]
        @size_id = temp_cart[1]
        @color_id = temp_cart[2]
        @qty = temp_cart[3]

        user_temp = current_user
        user_cart = Cart.new(unit: temp_cart, user_id: current_user.id)
        user_cart.save!

        product_temp = Product.find(@product_id)
        product_temp.popularity += 1
        product_temp.save!

        cookies.delete :cart_temp
        redirect_to cart_path

      else

        @product_id = params[:product_id]
        @size_id = params[:size]
        @color_id = params[:color]
        @qty = params[:qty]

        temp_item = []
        temp_item.push(@product_id)
        temp_item.push(@size_id)
        temp_item.push(@color_id)
        temp_item.push(@qty)

        user_temp = current_user
        user_cart = Cart.new(unit: temp_item, user_id: current_user.id)
        user_cart.save!

        product_temp = Product.find(@product_id)
        product_temp.popularity += 1
        product_temp.save!

        user_cart.save!
        redirect_to cart_path
      end
    end
  end

  def cart
    if !logged_in?
      redirect_to login_url
    else
        if cookies[:cart_temp].present?
          temp_cart = JSON.parse(cookies[:cart_temp])
          @product_id = temp_cart[0]
          @size_id = temp_cart[1]
          @color_id = temp_cart[2]
          @qty = temp_cart[3]

          user_temp = current_user
          user_cart = Cart.new(unit: temp_cart, user_id: current_user.id)
          user_cart.save!

          product_temp = Product.find(@product_id)
          product_temp.popularity += 1
          product_temp.save!

          cookies.delete :cart_temp
        end

    end


  end

  def checkout
    Cart.where(:user_id => current_user.id).delete_all
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in
      unless logged_in?
        store_location
        flash[:danger] = "Please log in!"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end


end