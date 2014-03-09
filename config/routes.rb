Mud::Application.routes.draw do

  #get "home/index"
  #devise_for :users
  #root 'control_panel#index'

  # TODO: put back in
  #authenticated :user do
  #  root :to => 'home#index'
  #end
  root to: "home#index"
  devise_for :users
  resources :users

end
