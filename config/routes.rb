Mud::Application.routes.draw do

  devise_for :users
  authenticated :user do
    root to: "control_panel#index", as: :authenticated_root
  end

  resources :users

  root to: "home#index"
  match ':controller(/:action(/:id(.:format)))'

end
