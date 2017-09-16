class MainController < ApplicationController
  def dashboard
    if current_user
      unless current_user.create_name
        redirect_to main_firstlogin_path
      end
    end
  end

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
  private
  def user_params
    params.require(:user).permit(:bname)
  end
end
