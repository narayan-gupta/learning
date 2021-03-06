class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  helper_method :current_user, :logged_in?
  
  def current_user
    User.find(session[:user_id]) if session[:user_id]    #Basically saying return this user if the user_id exists 
  end
  
  def logged_in?
    !!current_user
  end 
  
  def require_user 
    if !logged_in?
      flash[:danger] = "You must be logging in to perform this action"
      redirect_to root_path
    end 
  end
    
  def require_same_user 
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end 
  end
end
  
