Rails.application.routes.draw do
  root 'main#home'
  devise_for :users
  # get 'file_storages/index'
  # get 'file_storages/new'
  # get 'file_storages/create'
  # get 'file_storages/destroy'
  resources :file_storages, only: [:index, :new, :create, :destroy]  
  get 'file_storages/:id' => 'file_storages#download', as:'download_file_storage'
  resources :user, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    match '/sign-in' => "devise/sessions#new", :as => :login
  end
end
