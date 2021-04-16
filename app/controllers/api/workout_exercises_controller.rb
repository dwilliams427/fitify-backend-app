class Api::WorkoutExercisesController < ApplicationController
  def create
    @workout_exercise = WorkoutExercise.new(
      user_id: current_user.id,
      workout_id: params[:workout_id],
      exercise_id: params[:exercise_id],
    )
    #happy/sad path
    if @workout_exercise.save
      # render "show_workout_exercise.json.jb"             #happy path
      render json: { message: "workout exercise created" }
    else
      render json: { errors: @workout_exercise.errors.full_messages }, status: 406                       #sad path
    end
  end

  def show
    @workout_exercise = WorkoutExercise.find_by(id: params[:id])
    render "show.json.jb"
  end

  def destroy
    @workout_exercise = WorkoutExercise.find_by(workout_id: params[:workout_id], exercise_id: params[:exercise_id])
    @workout_exercise.destroy
    render json: { message: "workout_exercise successfully destroyed!" }
  end
end
