module SessionsHelper
  # Resource: https://3rd-edition.railstutorial.org/book/log_in_log_out#sec-sessions_and_failed_login

  # Logs in the given user. #used in sign up form - users/new
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    # @user = (User.find_by(id: session[:user_id]) || User.new)
    
    @current_user ||= User.find_by(id: session[:user_id])     # @current_user = @current_user || User.find_by(id: session[:user_id])
    # Because a User object is true in a boolean context, the call to find_by only gets executed if @current_user hasn’t been assigned.
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    # current_user.id != nil 
    !current_user.nil?
  end

  def require_logged_in
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in? #sessions#new is our login form - logging in creates a new session
  end

end