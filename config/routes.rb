##Rails.application.routes.draw do
BlacklightCornell::Application.routes.draw do

  root :to => "catalog#index"

  Blacklight.add_routes(self)
  get '/databases' => 'databases#index', :as => 'databases_index'
  get '/databases/title/:alpha' => 'databases#title', :as => 'databases_title'
  get '/databases/searchdb/' => 'databases#searchdb', :as => 'databases_searchdb'
  get '/databases/subject/:q' => 'databases#subject', :as => 'databases_subject'
  get '/databases/show/:id' => 'databases#show', :as => 'databases_show'
  get '/databases/searchERMdb/' => 'databases#searchERMdb', :as => 'databases_searchERMdb'

##  blacklight_for :catalog
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
