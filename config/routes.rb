Rails.application.routes.draw do

  root "welcome#index"

  resources :users do
    resources :ideas
  end

  resources :categories do
    resources :ideas
  end
end
