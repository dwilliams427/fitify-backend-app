class AddTimeToExercises < ActiveRecord::Migration[6.1]
  def change
    rename_column :exercises, :length, :time
  end
end
