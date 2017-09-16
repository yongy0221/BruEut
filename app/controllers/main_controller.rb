class MainController < ApplicationController
  def dashboard
    if current_user
      unless current_user.create_name
        redirect_to signout_path
      end
    end
  end

  def firstlogin
    @user=current_user
  end
  def make
    user=current_user
    user.bname = params[:user]["bname"]
    if user.bname
      user.create_name = true
    end
    user.save
    redirect_to root_path
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
