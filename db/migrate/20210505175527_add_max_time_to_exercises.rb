class AddMaxTimeToExercises < ActiveRecord::Migration[6.1]
  def change
    add_column :exercises, :max_time, :integer
  end
end
