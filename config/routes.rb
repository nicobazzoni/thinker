Rails.application.routes.draw do
  resources :ideas
  
  resources :thinkers, only: [:index, :create, :update, :destroy]
  resources :categories, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
