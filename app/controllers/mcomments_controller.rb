class McommentsController < ApplicationController
  #------모든 action전 닉네임 생성 체크
  before_action :user_name_done
  #------장터 댓글 생성
  def create
    @market = Market.find(params[:market_id])
    @mcomment = @market.mcomments.create(mcomment_params)
    @mcomment.save
    redirect_to market_path(@market)
  end
  #------장터 댓글 삭제
  def destroy
    @market = Market.find(params[:market_id])
    @mcomment = @market.mcomments.find(params[:id])
    if current_user.id == @mcomment.user_id || current_user.tier < 4
      @mcomment.destroy
    end
    redirect_to market_path(@market)
  end

  private
  def mcomment_params
    params.require(:mcomment).permit(:body, :user_id, :commenter)
  end
end
