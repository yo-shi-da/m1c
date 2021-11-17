Rails.application.routes.draw do

  resources :groups
  root to: 'meals#index'  

  resources :homes
  resources :favorites
  resources :personals

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
