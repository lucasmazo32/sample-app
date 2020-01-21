module SessionsHelper
    # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
# returns the current user or nil if no one is logged in
  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end
end
