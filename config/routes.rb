Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :dreams
  delete 'dreams/:id', to: 'dreams#destroy', as: 'delete_dream'
end
