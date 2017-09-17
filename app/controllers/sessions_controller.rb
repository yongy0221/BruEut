class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    puts "TEST"
    puts user
    puts user.create_name
    if user.create_name
      redirect_to root_path
    else
      redirect_to main_firstlogin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
