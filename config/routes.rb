Rails.application.routes.draw do
 resources :lists

get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
