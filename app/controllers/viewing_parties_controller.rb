class ViewingPartiesController < ApplicationController 
  before_action :require_login, only: [:new, :create]
  
  def new
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:movie_id])
  end 
  
  def create 
    user = User.find(params[:user_id])
    user.viewing_parties.create(viewing_party_params)
    redirect_to "/users/#{params[:user_id]}"
  end 

  private 

  def viewing_party_params 
    params.permit(:movie_id, :duration, :date, :time)
  end 

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this page"
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}"
    end
  end

  def logged_in?
    session[:user_id] != nil
  end
end 