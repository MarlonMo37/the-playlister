Rails.application.routes.draw do
  
  get 'auth/:provider/callback', to: 'sessions#omniauth'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: "user"

  get '/login', to: 'sessions#new' 
  post '/login', to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'


  resources :songs
  resources :playlists
  resources :users do
    resources :playlists
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
