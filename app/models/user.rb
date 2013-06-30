class User < ActiveRecord::Base
  
  attr_accessible :login #, :email, :password, :password_confirmation, :remember_me

  has_one  :cart
  has_many :orders

end
