Rails.application.routes.draw do
  devise_for :members
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/create'
  get 'orders/edit'
  get 'orders/update'
  get 'orders/destroy'
  get 'information/index'
  get 'information/show'
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/create'
  get 'events/edit'
  get 'events/update'
  get 'events/destroy'
  get 'club_documents/index'
  get 'club_documents/show'
  get 'club_documents/new'
  get 'club_documents/create'
  get 'club_documents/edit'
  get 'club_documents/update'
  get 'club_documents/destroy'
  get 'partners/index'
  get 'partners/show'
  get 'partners/new'
  get 'partners/create'
  get 'partners/edit'
  get 'partners/update'
  get 'partners/destroy'
  get 'home/index'
  get 'fish_infos/index'
  root 'home#index'

  resources :members do
    delete 'delete', on: :member, to: 'members#destroy'
  end
  resources :partners do
    delete 'delete', on: :member, to: 'partners#destroy'
  end
  resources :club_documents
  resources :fish_infos do
    delete 'delete', on: :member, to: 'fish_infos#destroy'
  end
  resources :plant_infos do
    delete 'delete', on: :member, to: 'plant_infos#destroy'
  end
  resources :order_infos do
    delete 'delete', on: :member, to: 'order_infos#destroy'
  end
  resources :item_infos

  resources :events do
    resources :event_participations, only: [:create, :destroy, :index, :new]
  end
  


  devise_for :members, class_name: 'Member', as: 'user_auth'
  devise_scope :member do
    get 'members', to: 'devise/session#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
