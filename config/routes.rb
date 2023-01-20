Rails.application.routes.draw do
  devise_for :customers
  namespace :public do
    #get 'cart_items/index'
  end
  namespace :public do
    #get 'items/index'
    #get 'items/show'
  end
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    #get 'items' => 'items#index'(例)
    root to: 'homes#top'
    get 'about' => 'homes#about'
    #get 'orders/new'
    resources :orders, only: [:new, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end
  namespace :admin do
   # get 'genres' => 'genres#index'
    #post 'genres' => 'genres#create'
    #get 'genres/:id/edit' => 'genres#edit', as: 'edit_admin'
    #patch 'genres/:id' => 'genres#update'

    resources :genres
    resources :items
    resources :customers
  end
end
