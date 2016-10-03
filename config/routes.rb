Rails.application.routes.draw do

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  devise_for :users

  resources :users, only: [:show] do
      resources :items, only: [:create, :destroy]
    end

  get 'welcome/index'
  root 'welcome#index'
end
