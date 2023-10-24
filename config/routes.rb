Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'
  get '/logout', to: 'users#logout', as: 'logout'
  post '/users', to: 'users#create'
  get '/movies', to: 'movies#index', as: 'movies'
  get '/movies/:id', to: 'movies#show', as: 'movie'

  # resources :users, only: :show - changed to dashboard path below due to using user ID instead
  get '/dashboard', to: 'users#show', as: 'user'

  get '/movies/:movie_id/viewing_parties/new', to: 'viewing_parties#new'
  post '/movies/:movie_id/viewing_parties', to: 'viewing_parties#create'
  get '/login', to: 'users#login_form', as: 'login_form'
  post '/login', to: 'users#login', as: 'login'
 
  namespace :admin do 
    get '/dashboard', to: 'dashboard#index'
    get '/users/:id', to: 'users#show', as: 'user'
  end
end
