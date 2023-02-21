Rails.application.routes.draw do
  namespace :public do
    #get 'cart_items/index'
  end
#skipオプションで不要なルーティングを削除
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    #get 'items' => 'items#index'(例)
    root to: 'homes#top'
    get 'about' => 'homes#about'
    #get 'orders/new'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :show, :create, :index]
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
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
end
