class Api::ExercisesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @exercise = Exercise.all
    render "index.json.jb"
  end

  def create
    @exercise = Exercise.new(
      name: params[:name],
      time: params[:time],
      reps: params[:reps],
      sets: params[:sets],
      image_url: params[:image_url],
      video_url: params[:video_url],
      user_id: current_user.id,
    )
    if @exercise.save
      render "show.json.jb"
    else
      render json: { errors: @exercise.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @exercise = Exercise.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @exercise = Exercise.find_by(id: params[:id])
    @exercise.name = params[:name] || @exercise.name
    @exercise.time = params[:time] || @exercise.time
    @exercise.reps = params[:reps] || @exercise.reps
    @exercise.sets = params[:sets] || @exercise.sets
    @exercise.user_id = params[:user_id] || @exercise.user_id
    @exercise.image_url = params[:image_url] || @exercise.image_url
    @exercise.video_url = params[:video_url] || @exercise.video_url

    if @exercise.save
      render "show.json.jb"
    else
      render json: { errors: @exercise.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @exercise = Exercise.find_by(id: params[:id])
    @exercise.destroy
    render json: { message: "exercise successfully destroyed!" }
  end
end
