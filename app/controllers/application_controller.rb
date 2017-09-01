class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception


  def login_check
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
    end

@page_index1=nil
@page_index2=nil
@page_index3=nil
@page_index4=nil

end
