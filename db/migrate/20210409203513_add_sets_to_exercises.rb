class AddSetsToExercises < ActiveRecord::Migration[6.1]
  def change
    rename_column :exercises, :quantity, :sets
  end
end
