class McommentsController < ApplicationController
  def create
    @market = Market.find(params[:market_id])
    @mcomment = @market.mcomments.create(mcomment_params)
    @mcomment.save
    redirect_to market_path(@market)
  end

  def destroy
    @market = Market.find(params[:market_id])
    @mcomment = @market.mcomments.find(params[:id])
    @mcomment.destroy
    redirect_to market_path(@market)
  end

  private
  def mcomment_params
    params.require(:mcomment).permit(:body, :user_id, :commenter)
  end
end
