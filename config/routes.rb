Rails.application.routes.draw do
  resources :topics

  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
end
