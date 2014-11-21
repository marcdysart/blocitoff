Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update, :show, :index]
  resources :lists do
    resources :items, only: [:create, :destroy] do
      patch "complete" => "items#complete", as: :complete_item
      patch "incomplete" => "items#incomplete", as: :incomplete_item
    end
  end

get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
