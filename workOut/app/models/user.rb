class User < ActiveRecord::Base
	authenticates_with_sorcery!
  
  # access
  attr_accessible :password, :email, :password_confirmation, :username, :age, 
  					:gender, :foot_height, :inches_height, :weight

  
  # validations
  validates_length_of :password, :minimum => 3, :message => "Password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates_uniqueness_of :email, :message => "This email is already in use.", :id => :email 
  validates_uniqueness_of :username, :message => "This username already exists. Please choose another username"
  # relationships
  has_many :plans

  # stuff for drop down menu
  GENDER_TYPES = ["Male", "Female", "Other"]
end
