Rails.application.routes.draw do

    root to: "events#index"
    devise_for :users
    resources :users, only: [:show]
    resources :events do
      resources :tickets, only: [:create]
    end

end
