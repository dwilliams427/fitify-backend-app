class Api::WorkoutsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @workout = Workout.all
    render "index.json.jb"
  end

  def create
    @workout = Workout.new(
      name: params[:name],
      image_url: params[:image_url],
      user_id: current_user.id,
    )
    if @workout.save
      render "show.json.jb"
    else
      render json: { errors: @workout.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @workout = Workout.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @workout = Workout.find_by(id: params[:id])
    @workout.name = params[:name] || @workout.name
    @workout.image_url = params[:image_url] || @workout.image_url
    @workout.user_id = params[:user_id] || @workout.user_id

    if @workout.save
      render "show.json.jb"
    else
      render json: { errors: @workout.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @workout = Workout.find_by(id: params[:id])
    @workout.destroy
    render json: { message: "workout successfully destroyed!" }
  end
end
