Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    #exercises
    get "/exercises", controller: "exercises", action: "index"
    get "/exercises/:id", controller: "exercises", action: "show"
    post "/exercises", controller: "exercises", action: "create"
    patch "/exercises/:id", controller: "exercises", action: "update"
    delete "/exercises/:id", controller: "exercises", action: "destroy"

    #workouts
    get "/workouts", controller: "workouts", action: "index"
    get "/workouts/:id", controller: "workouts", action: "show"
    post "/workouts", controller: "workouts", action: "create"
    patch "/workouts/:id", controller: "workouts", action: "update"
    delete "/workouts/:id", controller: "workouts", action: "destroy"

    #workout_exercises
    post "/workout_exercises", controller: "workout_exercises", action: "create"
    delete "/workout_exercises", controller: "workout_exercises", action: "destroy"
    get "/workout_exercises/:id", controller: "workout_exercises", action: "show"

    #user
    post "/users", controller: "users", action: "create"

    #sessions
    post "/sessions", controller: "sessions", action: "create"
  end
end
