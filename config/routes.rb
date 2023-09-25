Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to: 'pages#home'

  resources :genres
  resources :songs
  resources :sub_genres
  resources :artists
end
