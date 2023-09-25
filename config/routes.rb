Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to: 'pages#home'

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create]

  resources :genres
  resources :songs
  resources :sub_genres
  resources :artists
end
