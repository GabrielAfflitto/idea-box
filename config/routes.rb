Rails.application.routes.draw do

  root "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  # get '/dashboard'. to: ""

  resources :users, only: [:new, :create, :show] do
    resources :ideas, only: [:create, :edit, :update, :destroy, :show]
  end

  namespace :admin do
    resources :categories, only: [:index, :new, :create, :destroy]
  end

end
