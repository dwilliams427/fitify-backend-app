class RemoveMaxTimeFromExercises < ActiveRecord::Migration[6.1]
  def change
    remove_column :exercises, :max_time, :integer
  end
end
