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
    if current_user.id == @pcomment.user_id || current_user.tier < 4
      @pcomment.destroy
    endss
    redirect_to pointless_path(@pointless)
  end

  private
  def pcomment_params
    params.require(:pcomment).permit(:body, :user_id, :commenter)
  end
end
