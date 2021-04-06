class Api::WorkoutExercisesController < ApplicationController
  def create
    @workout_exercise = WorkoutExercise.new(
      workout_id: params[:workout_id],
      exercise_id: params[:exercise_id],
      user_id: current_user.id,
    )
    #happy/sad path
    if @workout_exercise.save
      # render "show_workout_exercise.json.jb"             #happy path
      render json: { message: "workout exercise created" }
    else
      render json: { errors: @workout_exercise.errors.full_messages }, status: 406                       #sad path
    end
  end
end
