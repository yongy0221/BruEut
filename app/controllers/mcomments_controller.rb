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
