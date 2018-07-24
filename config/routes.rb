Rails.application.routes.draw do
  get 'tickets/index'
  get 'tickets/show'
  get 'tickets/new'
  get 'tickets/create'
  devise_for :users
  root to: "events#index"
  resources :events
end
