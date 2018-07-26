Rails.application.routes.draw do

    root to: "events#index"
    devise_for :users #, controllers: { registrations: 'users/registrations' }
    resources :users, only: [:show, :edit, :update]
    resources :events do
      resources :tickets, only: [:create]
    end

end
