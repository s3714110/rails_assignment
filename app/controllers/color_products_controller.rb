class ColorProductsController < ApplicationController
  layout 'home'
  before_action :set_color_product, only: %i[ show edit update destroy ]
  before_action :admin_user, only: [:show, :index, :edit, :update, :destroy, :new, :create]

  # GET /color_products or /color_products.json
  def index
    @color_products = ColorProduct.all
  end

  # GET /color_products/1 or /color_products/1.json
  def show
  end

  # GET /color_products/new
  def new
    @color_product = ColorProduct.new
  end

  # GET /color_products/1/edit
  def edit
  end

  # POST /color_products or /color_products.json
  def create
    @color_product = ColorProduct.new(color_product_params)

    respond_to do |format|
      if @color_product.save
        format.html { redirect_to @color_product, notice: "Color product was successfully created." }
        format.json { render :show, status: :created, location: @color_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @color_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /color_products/1 or /color_products/1.json
  def update
    respond_to do |format|
      if @color_product.update(color_product_params)
        format.html { redirect_to @color_product, notice: "Color product was successfully updated." }
        format.json { render :show, status: :ok, location: @color_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @color_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /color_products/1 or /color_products/1.json
  def destroy
    @color_product.destroy
    respond_to do |format|
      format.html { redirect_to color_products_url, notice: "Color product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color_product
      @color_product = ColorProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def color_product_params
      params.require(:color_product).permit(:color_id, :product_id)
    end

    def admin_user
      redirect_to(root_url) unless ( logged_in? && current_user.admin?)
    end
end
