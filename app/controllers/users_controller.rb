class UsersController <ApplicationController 
  def new 
    @user = User.new()
  end 

  def show 
    @user = User.find(params[:id])
  end 

  def create
    # require 'pry';binding.pry
    user = user_params
    user[:name] = user[:name].downcase
    new_user = User.create(user)
    if new_user.save
      session[:user_id] = new_user[:id]
      flash[:success] = "Welcome, #{new_user.name}!"
      # require 'pry';binding.pry
      
      if new_user.admin? 
        redirect_to admin_dashboard_path
      elsif new_user.manager?
        redirect_to root_path
      else
        # redirect_to root_path
        redirect_to user_path(new_user)
      end
    else  
      flash[:error] = new_user.errors.full_messages.to_sentence
      redirect_to register_path
    end 
  end

  def login_form

  end

  def login
    user = User.find_by(email: params[:email])&.authenticate(params[:password])
    if user
      flash[:success] = "Welcome, #{user.name}!"
      session[:user_id] = user[:id]
      if user.admin? 
        redirect_to admin_dashboard_path
      elsif user.manager?
        redirect_to root_path
      else
        # redirect_to root_path
        redirect_to user_path(user)
      end
    else
      flash[:error] = "Credentials are incorrect"
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private 

  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end 
end 