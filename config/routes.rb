Rails.application.routes.draw do

  devise_for :users

  resources :courses do
    collection do
      get 'all', to: "courses#all"
    end
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
    root to: 'pages#home', as: :authenticated_root
  end
  
  resources :user_courses, except: [:show, :edit, :update]

  root to: "pages#welcome"

  get 'home' => 'pages#home', as: 'home'
  get 'users/:id' => 'users#show', as: 'user'
  get 'aboutus' => 'pages#aboutus', as: 'aboutus'
  get 'faq' => 'pages#faq', as: 'faq'
  get 'contact' => 'pages#contact', as: 'contact'
  get 'terms' => 'pages#terms', as: 'terms'
  get 'privacy' => 'pages#privacy', as: 'privacy'
  get 'leaderboard' => 'pages#leaderboard', as: 'leaderboard'
  get 'admininfo' => 'pages#admininfo', as: 'admininfo'
  

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
