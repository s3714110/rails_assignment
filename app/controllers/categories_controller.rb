class CategoriesController < ApplicationController
  layout 'home'
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :admin_user, only: [:index, :edit, :update, :destroy, :new, :create]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def saved_from_category
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
    @category_temp = Category.find(params[:category_temp])
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end

    def logged_in
      unless logged_in?
        store_location
        redirect_to root_url
      end
    end

    def admin_user
      redirect_to(root_url) unless ( logged_in? && current_user.admin?)
    end

end
