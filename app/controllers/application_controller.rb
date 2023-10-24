class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    # require 'pry';binding.pry
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
    # same as below 
    # if session[:user_id]
    #   @_current_user ||= User.find(session[:user_id])
    # end
    # require 'pry';binding.pry
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
