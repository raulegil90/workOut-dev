class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.string :fitness_area
      t.text :description
      t.timestamps
    end
  end
end
