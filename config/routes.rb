Rails.application.routes.draw do
  get 'users/new'

  root to: "static_pages#home"
  get "signup", to: "user#new"
  
  resources :users
end
