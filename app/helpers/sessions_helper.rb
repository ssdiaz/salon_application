module SessionsHelper

  # Logs in the given user.
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
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    end

end