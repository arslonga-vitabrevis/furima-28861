Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :create, :index, :edit, :show, :update, :destroy] do
  end
end
