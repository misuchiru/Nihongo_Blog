Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :cates
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: :tag
  namespace :dashboard do
    root 'posts#index'
    resources :posts
    resources :cates
    resources :trips do
      resources :events
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
