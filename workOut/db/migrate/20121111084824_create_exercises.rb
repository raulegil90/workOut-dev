class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :sets
      t.integer :reps_or_min
      t.timestamps
    end
  end
end
