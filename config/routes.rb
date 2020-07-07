Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about'
  get '/search' => 'search#search'
  # get 'users/follower' => 'users#follower'
  # get 'users/following' => 'users#following'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'following' => 'users#following'
    get 'follower' => 'users#follower'
  end
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
  # post 'follow/:id' => 'relationships#create', as: 'follow'
  # post 'unfollow/:id' => 'relationships#destroy', as:'unfollow'
end