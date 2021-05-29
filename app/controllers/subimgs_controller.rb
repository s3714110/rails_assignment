class SubimgsController < ApplicationController
  layout 'home'
  before_action :set_subimg, only: %i[ show edit update destroy ]
  before_action :admin_user, only: [:show, :index, :edit, :update, :destroy, :new, :create]

  # GET /subimgs or /subimgs.json
  def index
    @subimgs = Subimg.all
  end

  # GET /subimgs/1 or /subimgs/1.json
  def show
  end

  # GET /subimgs/new
  def new
    @subimg = Subimg.new
  end

  # GET /subimgs/1/edit
  def edit
  end

  # POST /subimgs or /subimgs.json
  def create
    @subimg = Subimg.new(subimg_params)

    respond_to do |format|
      if @subimg.save
        format.html { redirect_to @subimg, notice: "Subimg was successfully created." }
        format.json { render :show, status: :created, location: @subimg }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subimg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subimgs/1 or /subimgs/1.json
  def update
    respond_to do |format|
      if @subimg.update(subimg_params)
        format.html { redirect_to @subimg, notice: "Subimg was successfully updated." }
        format.json { render :show, status: :ok, location: @subimg }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subimg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subimgs/1 or /subimgs/1.json
  def destroy
    @subimg.destroy
    respond_to do |format|
      format.html { redirect_to subimgs_url, notice: "Subimg was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subimg
      @subimg = Subimg.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subimg_params
      params.require(:subimg).permit(:url, :product_id)
    end

    def admin_user
      redirect_to(root_url) unless ( logged_in? && current_user.admin?)
    end
end
