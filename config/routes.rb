Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  # Routes for Google authentication Login and Register
  get 'auth/google_oauth2', to: 'auth#google_oauth'
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get '/logout', to: 'sessions#destroy', as: :logout

  get '/about', to: 'about#index'

  resources :users, only: [:update, :edit]

  # Routes for a users extra information to be uploaded
  get '/extra_user_info_index/:id', to: 'extra_info#index', as: :extra_info
  get '/edit_extra_user_info/:id', to: 'extra_info#edit', as: :edit_extra_info
  put '/extra_user_info_edit/:id', to: 'extra_info#update', as: :update_info


  # User Profile Paths
  get '/profile', to: 'users#show', as: :profile
  get '/profile/edit', to: 'users#edit'
  patch '/profile/edit', to: 'users#update'
  namespace :profile do
    resources :contacts, only: [:new]
  end

  # Contact paths (also check contact paths namespaced in profile)
  resources :contacts, only: [:create, :new]

  # GROUP do we want to namespace this?
  get '/dashboard', to: 'dashboard#index'

  # notification paths
  get '/notification', to: 'notification#index'
  get '/reports', to: 'reports#index'

  # dead_man_switch paths
  resources :dead_man_switch, only: [:create, :update, :destroy]

  match '*path', to: 'application#four_oh_four', via: :all
end
