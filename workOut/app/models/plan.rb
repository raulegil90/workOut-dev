class Plan < ActiveRecord::Base
  attr_accessible :description, :fitness_area, :title, :user_id

  belongs_to :users
  has_many :exercises
  validates_uniqueness_of :id
end
