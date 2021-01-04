Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'registrations' }, :path => 'admin', :path_names => { :sign_in => 'login', :sign_up => 'new', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification' }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
end
