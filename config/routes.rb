Rails.application.routes.draw do
  devise_for :collaborators, path: "users"
  resources :collaborators
  #get '/patients/:id', to: 'patients#show', as: 'patient'
  root 'dashboard#index'
  resources :clients
  resources :appointments
end
