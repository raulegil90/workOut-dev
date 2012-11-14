class AddIdToModels < ActiveRecord::Migration
  def change
  	add_column :plans, :user_id, :integer
  	add_column :exercises, :plan_id, :integer
  end
end
