Rails.application.routes.draw do
  resources :yakushokus
  get 'search/search'
  resources :bushos
  resources :committees
  resources :users
  get  '/employee',  to: 'users#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help',  as:'helf'
  get '/about', to: 'static_pages#about'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'static_pages#home'
end
