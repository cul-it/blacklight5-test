BlacklightCornell::Application.routes.draw do

  root :to => "catalog#index"

  Blacklight.add_routes(self)

  devise_for :users
  get 'backend/holdings/:id' => 'backend#holdings', :as => 'backend_holdings'
  get 'backend/holdings_short/:id' => 'backend#holdings_short', :as => 'backend_holdings_short'
  get 'backend/holdings_shorth/:id' => 'backend#holdings_shorth', :as => 'backend_holdings_shorth'
  get 'backend/holdings_shorthm/:id' => 'backend#holdings_shorthm', :as => 'backend_holdings_shorthm', :constraints => { :id => /.+/}
  get 'backend/holdings_mail/:id' => 'backend#holdings_mail', :as => 'backend_holdings_mail'
# commenting out until certain this is a dead-end route  get 'backend/clio_recall/:id', :to => "backend#clio_recall" , :as => :clio_recall
  get 'backend/feedback_mail', :to => "backend#feedback_mail"
  
  post 'catalog/sms' => 'catalog#sms'#, :as => 'catalog_sms' # :via => :post
  get 'catalog/check_captcha' => 'catalog#check_captcha', :as => 'check_captcha'

  resources :catalog, only:  [:post, :get]
  get 'catalog/email' => 'catalog#email', :as => 'xcatalog_email', :via => :post
  
  
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
