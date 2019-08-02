Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #home_controllerのルーティング
  root 'home#top'

  get '/home/about' => 'home#about', as: 'about'

  #users_controllerのルーティング
  resources :users, only: [:show, :edit, :update]

  resources :admins

  #stories_controller,favorites_controller.story_comments_controllerのルーティング
  resources :notices do
  	resource :favorites, only: [:create, :destroy]
  end
end
