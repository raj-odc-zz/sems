Rails.application.routes.draw do
  # devise_for :users
  #
  root to: "users#index"
  #
  resources :address
  resources :address_types
  resources :board_types
  resources :class_lists do
    collection do
      get "update_class_list"
      get "class_list_infos"
    end
  end
  resources :fees_types
  resources :message_types
  resources :profile_types
  resources :profiles
  resources :roles
  resources :users
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~API ROUTES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  namespace :api, :defaults => { :format => 'json',layout: false } do
    resources :addresses
    resources :address_types
    resources :board_types
    resources :class_lists
    resources :fees_types
    resources :message_types
    resources :profile_types
    resources :profiles
    resources :roles
    resources :users
  end
 # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
