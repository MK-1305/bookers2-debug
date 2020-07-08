Rails.application.routes.draw do

  devise_for :users
  root 'home#top'
  get 'home/about'

  resources :users,only: [:show,:index,:edit,:update]
  resources :relationships, only: [:create, :destroy]
  get 'user/:id/follows' => 'relationships#following', as: 'follows'
  get 'user/:id/followers' => 'relationships#follower', as: 'followers'
  resources :books do
  	resources :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
end
