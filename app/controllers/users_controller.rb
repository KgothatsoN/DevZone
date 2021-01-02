class UsersController < ApplicationController
  # Security action, lock down controller unless user is logged in
  before_action :authenticate_user!
  
  def index
  
  end
  
  # GET request to /user/:id to show user profile
  def show
    @user = User.find(params[:id])
  end
end