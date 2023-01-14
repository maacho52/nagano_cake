Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  scope module: :public do
    #get 'items' => 'items#index'(例)
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
