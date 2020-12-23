Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  

  resources :users, only: [:show] do
    resources :friendships, only: [:create]
    
    post "/friendships/add", to: "friendships#add"
    post "/friendships/reject", to: "friendships#reject"
    post "/friendships/remove", to: "friendships#remove"
  end
  resources :friendships, only: [:index]
  resources :courses, only: [:index, :show] do
    resources :scores, only: [:new, :create]
  end
end
