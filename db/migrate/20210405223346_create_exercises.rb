class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :length
      t.integer :reps
      t.integer :quantity
      t.integer :user_id
      t.string :video_url
      t.string :image_url

      t.timestamps
    end
  end
end
