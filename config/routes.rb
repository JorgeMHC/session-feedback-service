Rails.application.routes.draw do
  # This will create the following route POST /sessions/:session_id/feedbacks
  resources :sessions, only: [] do
    resource :feedbacks, only: [:create]
  end

  # This will create the following route GET /feedbacks
  resources :feedbacks, only: [:index]
end
