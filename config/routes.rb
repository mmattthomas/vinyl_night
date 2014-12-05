Rails.application.routes.draw do

  resources :events

  #devise_for :users
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  #get "/login", :to => "devise/sessions#new" # Add a custom sign in route for user sign in
  #get "/logout", :to => "devise/sessions#destroy" # Add a custom sing out route for user sign out
  #get "/register", :to => "devise/registrations#new" # Add a Custom Route for Registrations

  root 'events#index'

  get 'static_pages/home'
  get 'static_pages/help'
  
end
