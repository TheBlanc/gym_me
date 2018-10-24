Rails.application.routes.draw do

    mount ActionCable.server => '/cable'

    devise_for :users, controllers: { registrations: 'users/registrations' }
    authenticated :user do

      root 'users#home', as: :authenticated_root
      get '/home', to: 'users#home'
    end

    root 'landings#index'

    resources :users, only: [:index, :show, :edit, :update]
    resources :landings, only: [:index]

    resources :personal_messages, only: [:new, :create]
    resources :conversations, only: [:index, :show]


    get '/discover', to: 'events#discover'
    get '/gymbuddy', to: 'users#gym_buddy'

    resources :events do
      resources :tickets, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

end
