Rails.application.routes.draw do
  get 'static_pages/home'
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end

  root to: 'jobs#index'
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
