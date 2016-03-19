Rails.application.routes.draw do

  devise_for :users

  resources :courses do
    resources :slides do
      collection do
        get 'overview', to: "slides#overview"
      end
    end
  end

  resources :slides do
    resources :notes do
      member do
        put 'like' => 'notes#upvote'
        put 'dislike' => 'notes#downvote'
      end
    end
  end

  resources :posts

  authenticated :user do
    root to: 'courses#index', as: :authenticated_root
  end
  
  root to: "pages#welcome"

  get 'users/profile' => 'users#show', as: 'user'
  get 'aboutus' => 'pages#aboutus', as: 'aboutus'
  get 'leaderboard' => 'pages#leaderboard', as: 'leaderboard'
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
