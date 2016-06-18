Rails.application.routes.draw do
  devise_for :collaborators
  root 'dashboard#index'
  resources :collaborators
  resources :clients

end
