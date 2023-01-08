Rails.application.routes.draw do
  devise_for :publics
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    get 'genres' => 'genres#index'
    post 'genres' => 'genres#create'
    get 'genres/:id/edit' => 'genres#edit'
    patch 'genres/:id' => 'genres#update'
  end
end
