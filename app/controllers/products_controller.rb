class ProductsController < ApplicationController
  layout 'home'
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @sub_imgs = Subimg.where(["product_id = ?", params[:id]]).all
    @colors = ColorProduct.where(["product_id = ?", params[:id]]).all
    @sizes = SizeProduct.where(["product_id = ?", params[:id]]).all
    @tags = TagProduct.where(["product_id = ?", params[:id]]).all
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def saved_from_product
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

    @product_temp = Product.find(params[:product_temp])
    @sub_imgs = Subimg.where(["product_id = ?", @product_temp.id]).all
    @colors = ColorProduct.where(["product_id = ?",  @product_temp.id]).all
    @sizes = SizeProduct.where(["product_id = ?",  @product_temp.id]).all
    @tags = TagProduct.where(["product_id = ?",  @product_temp.id]).all


    respond_to do |format|
      format.js
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :description, :img_link, :popularity)
    end
end
