Rails.application.routes.draw do
  devise_for :users
  root to: "articles#index"
  resources :articles, only: %i(index show) do
    resources :comments, only: %i(create destroy)
  end

  resources :user_articles, only: %i(new create edit update destroy)
  resources :users, only: :show

  get "about_us", to: "pages#about_us"
  get "contact_us", to: "pages#contact_us"
  post "contact_admin", to: "pages#contact_admin"
end
