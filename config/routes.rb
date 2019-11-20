Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  devise_for :users
  root to: 'pages#home'
  get '/users/editing', to: 'pages#edit_profile', as: 'edit_profile'
  get '/users/:id', to: 'pages#profile', as: 'user_profile'
  delete 'dreams/:id', to: 'dreams#destroy', as: 'delete_dream'
  resources :dreams, except: [:destroy] do
    resources :bookings
  end


resources :user, only: [:edit, :update]
end
