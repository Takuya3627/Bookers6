Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "homes#top"
  get "home/about" => "homes#about"
  get "follow_relationships/followers" => "follow_relationships#followers"
  get "follow_relationships/followings" => "follow_relationships#followings"
  get "/search", to: "searchs#search"

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :follow_relationships, only: [:create, :destroy]

end
