class WelcomeController < ApplicationController 
  def index 
    # cookies[:user_id] = 12
    unless session[:greeting]
      session[:greeting] = "Howdy!"
    end
    @users = User.all
  end 
end 