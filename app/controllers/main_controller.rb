class MainController < ApplicationController
  def dashboard
    redirect_to "/users/sign_in" unless user_signed_in?
  end
end
