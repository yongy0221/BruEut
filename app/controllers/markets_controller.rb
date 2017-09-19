class MarketsController < ApplicationController
  #-----모든 action 전 닉네임 완료 체크/market params 받아오기
  before_action :set_market, only: [:show, :edit, :update, :destroy, :sold, :samecheck, :tiercheck]
  before_action :user_name_done
  before_action :samecheck, only: [:sold, :edit]
  before_action :tiercheck, only: [:destroy]
  #------동일 유저 체크
  def samecheck
    unless @market.user==current_user
      redirect_to markets_path
    end
  end
  #------권한/유저 체크
  def tiercheck
    unless @maerket.user == current_user || current_user.tier < 4
      redirect_to markets_path
    end
  end
  #------판매중/판매완료 설정
  def sold
    @market.sold = true
    @market.save
    redirect_to :back
  end
  #------판매글 목록
  def index
    @markets = Market.paginate(:page => params[:page], :per_page => 20).reverse_order
  end
  def mrindex
    @markets = Market.where(:rec => true).paginate(:page => params[:page], :per_page => 20).reverse_order
  end
  def msindex
    @markets = Market.where(:sold => false).paginate(:page => params[:page], :per_page => 20).reverse_order
  end
  #------판매글 보기
  def show
    @user=current_user
  end
  #------새 판매글 생성
  def new
    @market = Market.new
  end
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
  #------판매글 수정
  def edit
  end
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
  #------판매글 삭제
  def destroy
    @market.destroy
    respond_to do |format|
      format.html { redirect_to markets_path}
      format.json { head :no_content }
    end
  end
  #-------lke/dislike
  # def like
  #   @market = Market.find(params[:market_id])
  #   if @market.mluids.where(user_id: current_user.id).present?
  #     @market.mluids.where(user_id: current_user.id).first.destroy
  #     @market.like = @market.like - 1
  #   else
  #     @mluid  = Mluid.new(user_id: current_user.id, market_id: @market.id)
  #     @mluid.save
  #     @market.like = @market.like + 1
  #   end
  #   @market.save
  #   redirect_to :back
  # end
  # def dislike
  #   @market = Market.find(params[:market_id])
  #   if @market.mdluids.where(user_id: current_user.id).present?
  #     @market.mdluids.where(user_id: current_user.id).first.destroy
  #     @market.dislike = @market.dislike - 1
  #   else
  #     @mdluid  = Mdluid.new(user_id: current_user.id, market_id: @market.id)
  #     @mdluid.save
  #     @market.dislike = @market.dislike + 1
  #   end
  #   @market.save
  #   redirect_to :back
  # end
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
