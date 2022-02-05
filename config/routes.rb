Rails.application.routes.draw do

  #devise routes
  devise_for :users
  devise_for :admins
  devise_for :agents


  root 'dashboard#index'


  #restful CRUD controllers
  resources :events, only: [:index, :create, :new]


  resources :app_users, only: [:index, :create, :new]


end
