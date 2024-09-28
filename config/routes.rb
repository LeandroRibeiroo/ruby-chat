Rails.application.routes.draw do
  get "dashboard/show"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "profiles/new"
  get "profiles/create"
  root "home#index"

  get "home/index"

  # Define routes for sign-in and sign-up
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "sign_out", to: "sessions#destroy"

  get "sign_up", to: "profiles#new"
  resources :profiles, only: [:create]

  # Dashboard
  get "dashboard", to: "dashboard#show"
end
