Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/about', to: 'about#index'

  resources :users, only: [:update, :edit]
  get '/extra_user_info_edit/:id', to: 'extra_info#edit'

end
