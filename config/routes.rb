Rails.application.routes.draw do
  resources :users
  get '/signup', to: 'users#new'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help',  as:'helf'
  get '/about', to: 'static_pages#about'
  root 'static_pages#home'
end
