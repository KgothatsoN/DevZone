class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :subscription
  has_one :profile
  
  attr_accessor :stripe_card_token
  def save_with_subscription
    if valid?
      customer = Stripe::Customer.create(description: email, plan: subscription_id, card: stripe_card_token)
      #Set stripe generated customer ID then save to DB
      self.stripe_customer_token = customer.id
      save!
    end
  end
end
