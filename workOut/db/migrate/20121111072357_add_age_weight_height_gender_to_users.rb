class AddAgeWeightHeightGenderToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :age, :integer
  	add_column :users, :weight, :integer
  	add_column :users, :foot_height, :integer
  	add_column :users, :inches_height, :integer
  	add_column :users, :gender, :string
  end
end
