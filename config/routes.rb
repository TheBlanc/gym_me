Rails.application.routes.draw do
    mount ActionCable.server => '/cable'
    root to: "events#index"

    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :users, only: [:index, :show, :edit, :update]
    resources :personal_messages, only: [:new, :create]
    resources :conversations, only: [:index, :show]

    get '/discover', to: 'events#discover'
    get '/gymbuddy', to: 'users#gym_buddy'

    resources :events do
      resources :tickets, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

end
