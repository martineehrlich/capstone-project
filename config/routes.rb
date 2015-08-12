Rails.application.routes.draw do
  root to: "static_pages#root"
  resources :users
  resource :session

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:show, :index]
    resources :arts, only: [:show, :new, :create, :index]
  end
end
