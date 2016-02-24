Rails.application.routes.draw do
  devise_for :users
  #
  root to: "users#index"
  #
  resources :roles
  resources :address
  resources :address_types
  resources :board_types
  resources :fees_types
  resources :message_types
  resources :profile_types
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~API ROUTES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  namespace :api, :defaults => { :format => 'json',layout: false } do
    resources :roles
    resources :addresses
    resources :address_types
    resources :board_types
    resources :fees_types
    resources :message_types
    resources :profile_types
  end
 # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
