Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to: 'pages#home'

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users

  resources :genres do
    collection do
      get 'find_genre'
    end
  end
  resources :songs do
    collection do
      get 'find_song'
    end
  end
  resources :sub_genres do
    collection do
      get 'find_sub_genre'
    end
  end
  resources :artists do
    collection do
      get 'find_artist'
    end
  end
  resources :pages do
    collection do
      get 'find_user'
    end
  end
end
