Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"

  resources :missing_animals do
    member do
      delete :found
    end
  end

  resources :found_animals

  resources :chatrooms, only: [:show, :create, :destroy, :index ] do
    member do
      patch :accept
      patch :decline
    end
    resources :messages, only: :create
  end

  post 'start_chat/:user_id', to: 'chatrooms#start_chat', as: 'start_chat'
end
