module ApplicationHelper
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized?
    logged_in? && current_user.admin == true
  end
end