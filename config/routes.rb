Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'users/edit'
  get 'users/update'
  get '/users/editing', to: 'pages#edit_profile', as: 'edit_profile'
  get '/users/:id', to: 'pages#profile', as: 'user_profile'

  resources :users, only: [:edit, :update]

# extra route for deleting a dream in order to get a prefix
  delete 'dreams/:id', to: 'dreams#destroy', as: 'delete_dream'

# booking routes are nested in a dream
  resources :dreams, except: [:destroy] do
    resources :bookings
  end


resources :user, only: [:edit, :update]
end
