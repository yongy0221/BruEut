class MainController < ApplicationController
  #-----rdiex,mrindex,msindex,dashboard 액션 전 유저 닉네임 설정 체크
  before_action :user_name_done, only: [:rindex, :mrindex, :msindex, :dashboard]

  def dashboard
  end

  #----닉네임 설정
  def firstlogin
    @user=current_user
  end
  def make
    unless User.where(bname: params[:user]["bname"].delete(' ')).empty?
      flash[:notice] = "이미 존재하는 닉네임입니다."
      redirect_to :back
    else
      user=current_user
      user.bname = params[:user]["bname"].delete(' ')
      if user.bname
        user.create_name = true
      end
      user.save
      redirect_to root_path
    end
  end
  def report
    @preport = Preport.new
    @preport.why = params[:preport]["why"]
    @preport.plink = params[:preport]["plink"]
    @preport.user_id = params[:preport]["user_id"]
    @preport.save
    redirect_to :back
  end
  def admin
    if current_user.id > 3
      redirect_to :back
    end
    @preports = Preport.all.reverse_order
  end
  private
  def user_params
    params.require(:user).permit(:bname)
  end
end
