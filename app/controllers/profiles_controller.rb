class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      session[:profile_id] = @profile.id
      redirect_to dashboard_path, notice: "Successfully signed up."
    else
      render :new, status: :unprocessable_content
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:user_id, :name, :image_url, :email, :password, :password_confirmation)
  end
end
