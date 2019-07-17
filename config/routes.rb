Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  # Routes for Google authentication
  get 'auth/google_oauth2/callback', to: 'sessions#googleAuth'
# get ‘auth/:provider/callback’, to: ‘sessions#googleAuth’
  get 'auth/failure', to: redirect('/')
# get ‘auth/failure’, to: redirect(‘/’)

  resources :users, only: [:edit]
end
