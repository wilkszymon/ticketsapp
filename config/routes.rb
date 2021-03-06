Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#new"
  
  resources :users, except: [:new]
  resources :tickets
  resources :searches

  get 'users/new'

  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
