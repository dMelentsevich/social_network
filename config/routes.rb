Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get '/signup',  to: 'users#new'
  resources :users
  resources :posts, only: %i[create destroy] do
    resources :comments, only: %i[create destroy]
  end

  root to: 'home#index'
end
