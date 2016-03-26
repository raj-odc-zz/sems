Rails.application.routes.draw do
  devise_for :users
  #
  root to: "profiles#index"
  #
  resources :address
  resources :address_types
  resources :board_types
  resources :class_lists do
    collection do
      get "update_class_list"
    end
    member do
      get "class_list_info"
    end
  end
  resources :exam_infos
  resources :fees_types
  resources :message_types
  resources :profile_types
  resources :profiles
  resources :roles
  resources :users
  resources :site_customizations
  resources :fees_structures
  resources :salary_details
  resources :staffs do
    collection do
      get "mark_list"
      get "mark_entry"
    end
  end
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~API ROUTES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  namespace :api, :defaults => { :format => 'json',layout: false } do
    resources :addresses
    resources :address_types
    resources :board_types
    resources :class_lists do
      member do
        get "class_list_info"
      end
    end
    resources :exam_types
    resources :fees_types
    resources :marks
    resources :message_types
    resources :profile_types
    resources :profiles
    resources :roles
    resources :students
    resources :subjects
    resources :users
    resources :fees_structures
    resources :salary_details
  end
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
