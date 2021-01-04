Rails.application.routes.draw do
  devise_for :users, :only => [:sessions], path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout'}
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  
  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :movies
      post :assign_favorite, to: 'favorites#assign_favorite'
      post :login, to: 'login#login_viewer'
      post :remove_favorite, to: 'favorites#remove_favorite'
      get :fav_movies, to: 'favorites#fav_movies'
    end
  end

  namespace :admin do
    resources :movies
    resources :users
    root 'movies#index'
  end

  root "admin/movies#index"
end
