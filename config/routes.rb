Rails.application.routes.draw do
  devise_for :users
  root to: "articles#index"
  resources :articles, only: %i(index show) do
    resources :comments, only: %i(create destroy)
  end
  resources :user_articles, only: %i(new create edit update destroy)
end
