Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  get '/help', to: 'static_pages#help',  as:'helf'
  get '/about', to: 'static_pages#about'
  root 'static_pages#home'
#  get 'static_pages/about'

end
