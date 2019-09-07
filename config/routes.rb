Rails.application.routes.draw do
  get 'static_pages/home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  namespace :admin do
    resources :users
  end

  root to: 'jobs#index'
  resources :jobs do
    post :confirm, action: :confirm_new, on: :new
    post :import, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
