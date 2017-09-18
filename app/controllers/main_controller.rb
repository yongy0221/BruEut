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
  def rindex
    @pointlesses = Pointless.where(:rec => true).paginate(:page => params[:page], :per_page => 20).reverse_order
  end

  def mrindex
    @markets = Market.where(:rec => true).paginate(:page => params[:page], :per_page => 20).reverse_order
  end
  def msindex
    @markets = Market.where(:sold => false).paginate(:page => params[:page], :per_page => 20).reverse_order
  end
  private
  def user_params
    params.require(:user).permit(:bname)
  end
end
