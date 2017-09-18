class MarketsController < ApplicationController
  before_action :set_market, only: [:show, :edit, :update, :destroy]

  # GET /markets
  # GET /markets.json
  def sold
    market = Market.find(params[:mid])
    market.sold = true
    market.save
    redirect_to :back
  end
  def like
    @market = Market.find(params[:market_id])
    if @market.mluids.where(user_id: current_user.id).present?
      @market.mluids.where(user_id: current_user.id).first.destroy
      @market.like = @market.like - 1
    else
      @mluid  = Mluid.new(user_id: current_user.id, market_id: @market.id)
      @mluid.save
      @market.like = @market.like + 1
    end
    @market.save
    redirect_to :back

  end
  def dislike
    @market = Market.find(params[:market_id])
    if @market.mdluids.where(user_id: current_user.id).present?
      @market.mdluids.where(user_id: current_user.id).first.destroy
      @market.dislike = @market.dislike - 1
    else
      @mdluid  = Mdluid.new(user_id: current_user.id, market_id: @market.id)
      @mdluid.save
      @market.dislike = @market.dislike + 1
    end
    @market.save
    redirect_to :back

    end
  def index
    @markets = Market.paginate(:page => params[:page], :per_page => 20).reverse_order
  end

  # GET /markets/1
  # GET /markets/1.json
  def show
    @user=current_user
    end

  # GET /markets/new
  def new
    @market = Market.new
  end

  # GET /markets/1/edit
  def edit
  end

  # POST /markets
  # POST /markets.json
  def create
    @market = Market.new(market_params)
    @market.user_id = current_user.id
    @market.hit = 0
    @market.like = 0
    @market.dislike = 0
    respond_to do |format|
      if @market.save
        format.html { redirect_to @market}
        format.json { render :show, status: :created, location: @market }
      else
        format.html { render :new }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /markets/1
  # PATCH/PUT /markets/1.json
  def update
    respond_to do |format|
      if @market.update(market_params)
        format.html { redirect_to @market}
        format.json { render :show, status: :ok, location: @market }
      else
        format.html { render :edit }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1
  # DELETE /markets/1.json
  def destroy
    @market.destroy
    respond_to do |format|
      format.html { redirect_to markets_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_params
      params.require(:market).permit(:title, :content)
    end
end
