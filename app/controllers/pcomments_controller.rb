class PcommentsController < ApplicationController
  def create
    @pointless = Pointless.find(params[:pointless_id])
    @pcomment = @pointless.pcomments.create(pcomment_params)
    @pcomment.save
    redirect_to pointless_path(@pointless)
  end

  def destroy
    @pointless = Pointless.find(params[:pointless_id])
    @pcomment = @pointless.pcomments.find(params[:id])
    @pcomment.destroy
    redirect_to pointless_path(@pointless)
  end

  private
  def pcomment_params
    params.require(:pcomment).permit(:body, :user_id, :commenter)
  end
end
