Rails.application.routes.draw do
  resources :sessions, only: [] do
    resource :feedbacks, only: [:create]
  end

  resources :feedbacks, only: [:index]
end
