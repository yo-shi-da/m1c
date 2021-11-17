Rails.application.routes.draw do
  
  resources :meals
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }  
  
end
