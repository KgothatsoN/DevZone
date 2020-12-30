class UsersController < ApplicationController
  # GET request to /user/:id to show user profile
  def show
    @user = User.find(params[:id])
  end
end