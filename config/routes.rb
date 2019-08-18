Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show,:edit,:update] do
  	resource :follows
  	get 'follows/follow_index' => 'follows#follow_index'
  	get 'follows/follower_index' => 'follows#follower_index'
  end


  get 'users/' =>'users#index'
  root 'home#top'
  get 'home/about' => 'home#about'
  get 'search/search' => 'search#search'
  get 'search/search_start' => 'search#search_start'


  resources :books do
  	resources :book_comments
  	resource :favorites, only: [:create, :destroy,:index]
  end

end
