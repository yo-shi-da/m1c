Rails.application.routes.draw do

  root to: 'meals#index'  
  
  resources :groups
  resources :homes
  resources :favorites
  resources :personals

  get '/member_all', to: 'groups#member_all'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }  
  
  patch 'meals', to: 'meals#read_changes'

  resources :meals do
    get 'calendar', to: 'meals#calendar'
    get 'graph', to: 'meals#graph'
  end
  
end
