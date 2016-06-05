Rails.application.routes.draw do
  match '/users' => 'users#create', via: [:post]
  devise_for :users
  root to: 'dashboard#index'
  resources :dashboard
  resources :address
  resources :address_types
  resources :board_types
  resources :batch_lists
  resources :student_class_batches
  resources :class_lists do
    collection do
      get 'update_class_list'
    end
    member do
      get 'class_list_info'
    end
  end
  resources :exam_infos
  resources :fees_types
  resources :fees_structures
  resources :message_types
  resources :profile_types
  resources :profiles
  resources :roles
  resources :users
  resources :salary_details do
    collection do
      get 'salary_detail_pdf'
    end
  end
  resources :site_customizations
  resources :staffs do
    collection do
      get 'mark_list'
      get 'mark_entry'
    end
  end
  resources :students do
    collection do
      get 'fees_receipt/(:id)', to: 'students#fees_receipt'
    end
  end
  resources :work_experiences
  resources :amount_transactions

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~API ROUTES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  namespace :api, :defaults => { :format => 'json',layout: false } do
    resources :addresses
    resources :address_types
    resources :board_types
    resources :class_lists
    resources :batch_lists
    resources :exam_types
    resources :fees_types
    resources :fees_structures
    resources :marks
    resources :message_types
    resources :profile_types
    resources :profiles
    resources :roles
    resources :salary_details
    resources :staffs
    resources :student_class_batches
    resources :students do
      member do
        get 'fees_info'
      end
    end
    resources :amount_transactions
    resources :subjects
    resources :users
  end
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
