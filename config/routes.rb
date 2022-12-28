Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/employee',  to: 'users#index'

  post '/signup',  to: 'users#create'
  get  '/signup',  to: 'users#new'
  get '/help', to: 'static_pages#help',  as:'helf'
  get '/about', to: 'static_pages#about'
  root 'static_pages#home'
  resources :users

end
