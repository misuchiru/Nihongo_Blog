Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :cates
  resources :posts
  namespace :dashboard do
    resources :posts
    resources :cates
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
