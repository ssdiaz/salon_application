module SessionsHelper
  # Logs in the given user. Used in sign up form (users/new)
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user, if any
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # Explained:
      # @user = (User.find_by(id: session[:user_id]) || User.new) 
      # @current_user = @current_user || User.find_by(id: session[:user_id])
      # Because a User object is true in a boolean context, the call to find_by only gets executed if @current_user hasn’t been assigned.
  end

  # Returns true if the user is logged in  # current_user.id != nil 
  def logged_in?
    !current_user.nil?
  end

  def require_logged_in
    # flash[:success] = "You must log in to see this page"
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in? #sessions#new is our login form; logging in creates a new session
  end

  def check_if_profile_matches_current_user(user)
    if current_user != user
      flash[:success] = "You cannot view or edit another user"
      redirect_to users_path
    end
  end
  
end