Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  # Routes for Google authentication

  get 'auth/google_oauth2', to: 'auth#google_oauth'
  get 'auth/google_oauth2/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

  get '/about', to: 'about#index'

  resources :users, only: [:update, :edit]
  get '/extra_user_info_edit/:id', to: 'extra_info#edit'

  # User Profile Paths
  get '/profile', to: 'users#show', as: :profile
  get '/profile/edit', to: 'users#edit', as: :edit_profile
  patch '/profile/edit', to: 'users#update'

  # GROUP do we want to namespace this?
  get '/dashboard', to: 'dashboard#index'

end
