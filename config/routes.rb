Rails.application.routes.draw do
    mount ActionCable.server => '/cable'
    root to: "events#index"

    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :users, only: [:show, :edit, :update]
    resources :chat_rooms, only: [:new, :create, :show, :index]

    resources :events do
      resources :tickets, only: [:create]
      resources :comments, only: [:create, :destroy]
    end

end
