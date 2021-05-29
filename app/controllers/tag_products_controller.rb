class TagProductsController < ApplicationController
  layout 'home'
  before_action :set_tag_product, only: %i[ show edit update destroy ]
  before_action :admin_user, only: [:show, :index, :edit, :update, :destroy, :new, :create]

  # GET /tag_products or /tag_products.json
  def index
    @tag_products = TagProduct.all
  end

  # GET /tag_products/1 or /tag_products/1.json
  def show
  end

  # GET /tag_products/new
  def new
    @tag_product = TagProduct.new
  end

  # GET /tag_products/1/edit
  def edit
  end

  # POST /tag_products or /tag_products.json
  def create
    @tag_product = TagProduct.new(tag_product_params)

    respond_to do |format|
      if @tag_product.save
        format.html { redirect_to @tag_product, notice: "Tag product was successfully created." }
        format.json { render :show, status: :created, location: @tag_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_products/1 or /tag_products/1.json
  def update
    respond_to do |format|
      if @tag_product.update(tag_product_params)
        format.html { redirect_to @tag_product, notice: "Tag product was successfully updated." }
        format.json { render :show, status: :ok, location: @tag_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_products/1 or /tag_products/1.json
  def destroy
    @tag_product.destroy
    respond_to do |format|
      format.html { redirect_to tag_products_url, notice: "Tag product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_product
      @tag_product = TagProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_product_params
      params.require(:tag_product).permit(:tag_id, :product_id)
    end

    def admin_user
      redirect_to(root_url) unless ( logged_in? && current_user.admin?)
    end
end
