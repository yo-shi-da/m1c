Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'homes#index'
  
  resources :posts
  resources :groups
  resources :homes
  resources :favorites
  resources :personals
  resources :members

  get '/member_all', to: 'groups#member_all'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users
  
  patch 'meals', to: 'meals#read_changes'
  resources :meals do
    get 'calendar', to: 'meals#calendar'
    get 'graph', to: 'meals#graph'
  end

  
end
