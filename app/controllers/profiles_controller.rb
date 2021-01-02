class ProfilesController < ApplicationController
  # Before a user can view profiles verify they are registered and logged in
  before_action :authenticate_user!
  # Allows users to only edit their profile
  before_action :only_current_user
  
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
      redirect_to user_path(params[:user_id])
    else
      render action: :new
    end 
  end 
  
  # GET request to /users/:user_id/profile/edit
  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end
  
  #PUT request to /users/:user_id/profile
  def update
    # Retrieve user from DB using ID
    @user = User.find(params[:user_id])
    @profile = @user.profile
    # Mass assign edited profile attributes and update
    if @profile.update_attributes(profile_params)
      flash[:success] = "Updated Profile!"
      #Redirect user to updated profile page
      redirect_to user_path(params[:user_id])
    else
      render action: :edit
      flash[:error] = "Error! Update Unsuccessful"
    end
  end
  
  private
    # Whitelist profile fields from profile form
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :occupation, :telephone_number, :email, :about)
    end 
    
    def only_current_user
      @user = User.find(params[:user_id])
      # If user is trying to access another users profile, redirect them to the homepage
      redirect_to (root_url) unless @user == current_user
    end
end