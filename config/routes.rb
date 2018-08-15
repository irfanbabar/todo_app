Rails.application.routes.draw do

  devise_for :users

  get 'home/index'
  get '/home/new',  to:     'home#new'
  post '/appointments/token', to: 'appointments#generate_token' 
  get '/appointments', to: 'appointments#index'
  post '/appointments', to: 'appointments#create'
  get  '/appointments/new', to: 'appointments#new'
  delete '/appointments/:id', to: 'appointments#destroy'
   
  # default_url_options host: 'localhost:3000'
  # mount LetterOpenerWeb::Engine, at: "/letter_opener"

  root 'home#index'
end
