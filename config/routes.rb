Rails.application.routes.draw do

  root to: "static_pages#home"
  get "signup", to: "users#new"
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :users do
    member do
      get :follower, to: "users#follower"
      get :following, to: "users#following"
      
    end
  end
  
  get :following, to: "users#following"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]

end
