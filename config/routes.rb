Rails.application.routes.draw do

  root "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create, :show] do
    resources :ideas, only: [:create, :edit, :update, :destroy, :show]
  end

  namespace :admin do
    get '/dashboard', to: "dashboard#index"
    resources :categories, only: [:new, :create, :destroy]
    resources :images, only: [:new, :create, :destroy]
  end

end
