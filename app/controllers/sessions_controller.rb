class SessionsController < ApplicationController
  def new
  end

  def create
    profile = Profile.find_by(email: params[:session][:email])
    if profile && profile.authenticate(params[:session][:password])
      # Log the user in
      session[:profile_id] = profile.id
      redirect_to dashboard_path, notice: "Successfully signed in!"
    else
      flash.now[:alert] = "Invalid email/password"
      render :new
    end
  end

  def destroy
    session[:profile_id] = nil
    redirect_to root_path, notice: "Successfully signed out!"
  end
end
