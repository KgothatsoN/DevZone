class ProfilesController < ApplicationController
  # GET request to /users/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile = Profile.new
  end
  
  # POSTrequest to /users/:user_id/profile after filling out profile form
  def create
    # Retrieve user id and assign it to logged in user
    @user = User.find(params[:user_id])
    @profile = @user.build_profile(profile_params)
    
    
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to root_path
    else
      render action: :new
    end 
  end 
  
  
  
  private
    # Whitelist profile fields from profile form
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :occupation, :telephone_number, :email, :about)
    end 
end