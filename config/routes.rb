Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/:id', to: 'pages#profile', as: 'user_profile'
  resources :dreams
  #nest routes for bookings
  delete 'dreams/:id', to: 'dreams#destroy', as: 'delete_dream'
end
