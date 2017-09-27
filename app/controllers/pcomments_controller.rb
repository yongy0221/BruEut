class PcommentsController < ApplicationController
  #------모든 action전 닉네임 생성 체크
  before_action :user_name_done
  #------뻘게 댓글 생성
  def create
    @pointless = Pointless.find(params[:pointless_id])
    @pcomment = @pointless.pcomments.create(pcomment_params)
    @pcomment.save
    redirect_to pointless_path(@pointless)
  end
  #------뻘게 댓글 삭제
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
