Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show,:edit,:update]
  get 'users/' =>'users#index'
  root 'home#top'
  get 'home/about' => 'home#about'

  resources :books

end
