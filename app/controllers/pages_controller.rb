class PagesController < ApplicationController
  # GET request for / (homepage)
  def home
    @basic_subscription = Subscription.find(1)
    @pro_subscription = Subscription.find(2)
  end
  
  # Get request for About page
  def about
  end
end