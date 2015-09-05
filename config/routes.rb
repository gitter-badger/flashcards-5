Rails.application.routes.draw do

  get 'oauths/oauth'

  get 'oauths/callback'

  # get 'oauths/oauth'

  # get 'oauths/callback', to: "oauth/callback"

  root 'flashcards#index'

  resources :cards
  resources :reviews
  resources :users
    get '/sign_up', to: 'users#new', as: :sign_up
    resources :sessions, only: [:new, :create, :destroy]
    get '/log_in', to: 'sessions#new', as: :log_in
    delete '/log_out', to: 'sessions#destroy', as: :log_out

      post "oauth/callback" => "oauths#callback"
      get "oauth/callback" => "oauths#callback"
      get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider


  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
