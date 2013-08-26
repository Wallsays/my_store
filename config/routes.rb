MyStore::Application.routes.draw do

  # devise_scope :user do
  # 	get "/users/sign_out" => "devise/sessions#destroy"
  # end

  # device_for :users

  resources :items do
  	get :upvote, on: :member # for every resources
  	get :expensive, on: :collection
  end
  
  get "admin/users_count" => "admin#users_count"

  # match ':controller(/:action(/:id))(.:format)'
end
