Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show, :edit, :update] do
      get 'eventme_pictures_set' => 'users#eventme_pictures_set'
      get 'pictures' => 'users#pictures'
      get 'receiver' => 'users#receiver'
      patch 'update_picture' => 'users#update_picture'
    end
  get "search" => "users#search"
  resources :events, only: [:index]
  resources :decisions, only: [:create, :update]
  root to: "pages#home"
end
