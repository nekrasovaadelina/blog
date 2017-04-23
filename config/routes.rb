Rails.application.routes.draw do
  devise_for :users
  root to: "pages#main_page"
  resources :articles, only: %i(index show) do
    resources :comments, only: %i(create destroy)
  end

  resources :user_articles, only: %i(new create edit update destroy)
  resources :users, only: :show
  resources :ask_articles, only: %i(index show) do
    resources :ask_comments, only: %i(create destroy)
  end

  resources :user_ask_articles, only: %i(new create edit update destroy)

  get "about_us", to: "pages#about_us"
  get "contact_us", to: "pages#contact_us"
  post "contact_admin", to: "pages#contact_admin"
  get "main_page", to: "pages#main_page"
end
