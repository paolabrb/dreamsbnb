Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  devise_for :users
  root to: 'pages#home'
  get '/users/:id', to: 'pages#profile', as: 'user_profile'
  delete 'dreams/:id', to: 'dreams#destroy', as: 'delete_dream'
  resources :dreams, except: [:destroy] do
    # delete '/dreams/:dream_id/bookings/:id', to: 'bookings#destroy', as: 'delete_booking'
    resources :bookings
  end
end
