Hear::Application.routes.draw do
  get "album_listen/listen"

  get "album_listen/unlisten"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  
  root :to => 'page#home'

  match '/u/:username' => 'user#overview'
  match '/signup', :to => 'user#new', :via =>:get, :as => :sign_up
  match '/signup', :to => 'user#create', :via => :post, :as => :sign_up

  match '/add', :to => 'album#create', :via => :post, :as => :user_albums

  match '/login', :to => 'sessions#new', :via => :get, :as => :session_login
  match '/login', :to => 'sessions#create', :via => :post, :as => :session_login

  match '/albums/sort', :to => 'album#sort', :as => :sort
  match '/albums/listen', :to => 'AlbumListen#listen', :as => :listen
  match '/albums/unlisten', :to => 'AlbumListen#unlisten', :as => :unlisten
  match '/albums/remove', :to => 'album#remove', :as => :remove_album

  match '/logout', :to => 'sessions#destroy', :via => :get, :as => :logout

  match '/nope', :to => 'page#nouser', :via => :get, :as => :nouser

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
