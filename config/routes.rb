Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'tops#index'
  
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

  # guest
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/guest_admin_sign_in', to: 'users/sessions#new_guest_admin'
  end

  resources :users
  
  patch 'meals', to: 'meals#read_changes'
  get 'export_csv', to: 'meals#export_csv'
  resources :meals do
    get 'calendar', to: 'meals#calendar'
    get 'graph', to: 'meals#graph'
  end
    
end
