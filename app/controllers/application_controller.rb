class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  helper_method :current_profile

  private
  def current_profile
    @current_profile ||= Profile.find_by(id: session[:profile_id]) if session[:profile_id]
  end

  def require_login
    unless current_profile
      redirect_to root_path, alert = "You must be logged in to access this section."
    end
  end
end
