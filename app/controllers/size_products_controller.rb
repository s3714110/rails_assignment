class SizeProductsController < ApplicationController
  before_action :set_size_product, only: %i[ show edit update destroy ]

  # GET /size_products or /size_products.json
  def index
    @size_products = SizeProduct.all
  end

  # GET /size_products/1 or /size_products/1.json
  def show
  end

  # GET /size_products/new
  def new
    @size_product = SizeProduct.new
  end

  # GET /size_products/1/edit
  def edit
  end

  # POST /size_products or /size_products.json
  def create
    @size_product = SizeProduct.new(size_product_params)

    respond_to do |format|
      if @size_product.save
        format.html { redirect_to @size_product, notice: "Size product was successfully created." }
        format.json { render :show, status: :created, location: @size_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @size_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /size_products/1 or /size_products/1.json
  def update
    respond_to do |format|
      if @size_product.update(size_product_params)
        format.html { redirect_to @size_product, notice: "Size product was successfully updated." }
        format.json { render :show, status: :ok, location: @size_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @size_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /size_products/1 or /size_products/1.json
  def destroy
    @size_product.destroy
    respond_to do |format|
      format.html { redirect_to size_products_url, notice: "Size product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size_product
      @size_product = SizeProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def size_product_params
      params.require(:size_product).permit(:size_id, :product_id)
    end
end
