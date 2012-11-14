class Exercise < ActiveRecord::Base
  attr_accessible :name, :reps_or_min, :sets, :plan_id

  has_and_belongs_to_many :plans
end
