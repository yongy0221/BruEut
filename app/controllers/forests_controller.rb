class ForestsController < ApplicationController
  before_action :set_forest, only: [:show, :edit, :update, :destroy]

  def maketrue
    if current_user.teir == 1
      @forest=Forest.find(params[:format])
      @forest.censored=true
      @forest.save
    end
    redirect_to :back
  end
  # GET /forests
  # GET /forests.json
  def index
    @user=current_user
    @forests = Forest.all.reverse_order
  end

  # GET /forests/1
  # GET /forests/1.json
  def show
  end

  # GET /forests/new
  def new
    @forest = Forest.new
  end

  # GET /forests/1/edit
  def edit
    if current_user.tier != 1
      redirect_to :back
    end
  end

  # POST /forests
  # POST /forests.json
  def create
    @forest = Forest.new(forest_params)
    @forest.censored=false
    respond_to do |format|
      if @forest.save
        format.html { redirect_to forests_path, notice: '대숲에서 사연을 받았습니다.' }
        format.json { render :show, status: :created, location: @forest }
      else
        format.html { render :new }
        format.json { render json: @forest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forests/1
  # PATCH/PUT /forests/1.json
  def update
    respond_to do |format|
      if @forest.update(forest_params)
        format.html { redirect_to @forest, notice: 'Forest was successfully updated.' }
        format.json { render :show, status: :ok, location: @forest }
      else
        format.html { render :edit }
        format.json { render json: @forest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forests/1
  # DELETE /forests/1.json
  def destroy
    if current_user != 1
      redirect_to :back
    end
    @forest.destroy
    respond_to do |format|
      format.html { redirect_to forests_url, notice: 'Forest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forest
      @forest = Forest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forest_params
      params.require(:forest).permit(:content)
    end
end
