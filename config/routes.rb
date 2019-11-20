Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles do
    resources :comments, only: [:create]
    collection do
      get 'shows'
    end
  end
  resources :users, only: [:show]
end
