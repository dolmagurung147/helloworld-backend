Rails.application.routes.draw do

  resources :users
  resources :posts
  resources :likes
  resources :comments

  post '/login', to: 'auth#create'
  get '/login', to: 'auth#login'
end
