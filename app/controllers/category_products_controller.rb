class CategoryProductsController < ApplicationController
  layout 'home'
  before_action :set_category_product, only: %i[ show edit update destroy ]
  before_action :admin_user, only: [:show, :index, :edit, :update, :destroy, :new, :create]

  # GET /category_products or /category_products.json
  def index
    @category_products = CategoryProduct.all
  end

  # GET /category_products/1 or /category_products/1.json
  def show
  end

  # GET /category_products/new
  def new
    @category_product = CategoryProduct.new
  end

  # GET /category_products/1/edit
  def edit
  end

  # POST /category_products or /category_products.json
  def create
    @category_product = CategoryProduct.new(category_product_params)

    respond_to do |format|
      if @category_product.save
        format.html { redirect_to @category_product, notice: "Category product was successfully created." }
        format.json { render :show, status: :created, location: @category_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_products/1 or /category_products/1.json
  def update
    respond_to do |format|
      if @category_product.update(category_product_params)
        format.html { redirect_to @category_product, notice: "Category product was successfully updated." }
        format.json { render :show, status: :ok, location: @category_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_products/1 or /category_products/1.json
  def destroy
    @category_product.destroy
    respond_to do |format|
      format.html { redirect_to category_products_url, notice: "Category product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_product
      @category_product = CategoryProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_product_params
      params.require(:category_product).permit(:category_id, :product_id)
    end

    def admin_user
      redirect_to(root_url) unless ( logged_in? && current_user.admin?)
    end
end
