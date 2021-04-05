class User < ApplicationRecord
  has_many: workouts
  has_many: workout_exercises
  has_many: exercises
end
