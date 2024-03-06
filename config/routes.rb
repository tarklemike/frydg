Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create, :destroy]
    resources :recipe_ingredients, only: [:new, :create, :destroy]
  end

  resources :ingredients, only: [:create, :new]
  resources :users, only: [:show, :update, :edit]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :recipes do
    resources :reviews , only: [:create]
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
