Rails.application.routes.draw do
  root 'statuses#dashboard'
  resources :statuses
  get 'dashboard', to: 'statuses#dashboard'
end
