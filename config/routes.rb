Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"

  resources :users do
    resources :categories do
      resources :expenses
    end
  end
  # Defines the root path route ("/")
  # root "posts#index"
end