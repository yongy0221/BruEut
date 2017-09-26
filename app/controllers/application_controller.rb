class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  #------로그인 체크
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  #------닉네임 설정 완료 체크
  helper_method :user_name_done
  def user_name_done
    if current_user
      unless current_user.create_name
        redirect_to main_firstlogin_path
      end
    end
  end



@page_index1=nil
@page_index2=nil
@page_index3=nil
@page_index4=nil

end
