MyStore::Application.routes.draw do
  resources :items do
  	get :upvote, on: :member # for every resources
  	get :expensive, on: :collection
  end

  # match ':controller(/:action(/:id))(.:format)'
end
