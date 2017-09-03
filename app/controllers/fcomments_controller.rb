class FcommentsController < ApplicationController
  def create
    @forest = Forest.find(params[:forest_id])
    @fcomment = @forest.fcomments.create(fcomment_params)
    @fcomment.save
    redirect_to forests_path
  end

  def destroy
    @forest = Forest.find(params[:forest_id])
    @fcomment = @forest.fcomments.find(params[:id])
    @fcomment.destroy
    redirect_to forests_path
  end

  private
  def fcomment_params
    params.require(:fcomment).permit(:body, :user_id, :commenter)
  end
end
