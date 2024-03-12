Rails.application.routes.draw do
  get 'foodbanks/index'
  get 'foodbanks/show'
  get 'foodbanks/new'
  get 'foodbanks/create'
  get 'foodbanks/edit'
  get 'foodbanks/update'
  get 'foodbanks/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create, :destroy]
    resources :recipe_ingredients, only: [:new, :create, :destroy]
    get "recipe_ingredients", to: "recipe_ingredients#recipe_ingredient_list"

  end
  post "recipes/:id/add_favorite", to: "recipes#add_favorite", as: :add_favorite
  post "recipes/:id/remove_favorite", to: "recipes#remove_favorite", as: :remove_favorite
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
