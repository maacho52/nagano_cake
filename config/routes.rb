Rails.application.routes.draw do
  namespace :public do
    #get 'cart_items/index'
  end
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    #get 'items' => 'items#index'(例)
    root to: 'homes#top'
    get 'about' => 'homes#about'
    #get 'orders/new'
    resources :orders, only: [:new, :show, :create]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]

    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdraw' => 'customers#withdraw'

    post 'orders/check' => 'orders#check'
    get 'order/complete' => 'orders#complete'

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  end
  namespace :admin do
    root to: 'homes#top'
   # get 'genres' => 'genres#index'
    #post 'genres' => 'genres#create'
    #get 'genres/:id/edit' => 'genres#edit', as: 'edit_admin'
    #patch 'genres/:id' => 'genres#update'

    resources :genres
    resources :items
    resources :customers
  end

  devise_for :customers
end
