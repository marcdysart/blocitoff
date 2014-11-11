Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update]
  resources :lists

get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
