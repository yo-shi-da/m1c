Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root to: 'tops#index'
  
  resources :foods
  resources :posts, except: [:index, :show]
  resources :groups
  resources :homes, only: [:index, :show]
  resources :favorites, only: [:index, :create, :destroy]
  resources :personals, except: [:index]
  resources :members, only: [:create, :destroy]

  get '/member_all', to: 'groups#member_all'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/guest_admin_sign_in', to: 'users/sessions#new_guest_admin'
  end

  resources :users, only: [:index, :show]
  
  resources :meals do
    get 'calendar', to: 'meals#calendar'
    get 'graph', to: 'meals#graph'
    patch 'meals', to: 'meals#read_changes'
  end
  get 'export_csv', to: 'meals#export_csv'
    
end
