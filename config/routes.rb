Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update, :show, :index]
  resources :lists do
    resources :items, only: [:create, :destroy]
  end

get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
