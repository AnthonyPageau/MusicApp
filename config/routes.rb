Rails.application.routes.draw do
  resources :sub_genres
  root "pages#home"

  get 'pages/home', to: 'pages#home'

  resources :genres
end
