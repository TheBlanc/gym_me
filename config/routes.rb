Rails.application.routes.draw do
    mount ActionCable.server => '/cable'
    root to: "events#index"

    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :users, only: [:index, :show, :edit, :update]
    resources :chat_rooms, only: [:new, :create, :show, :index]

    get '/discover', to: 'events#discover'
    get '/gymbuddy', to: 'users#gym_buddy'

    resources :events do
      resources :tickets, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

end
