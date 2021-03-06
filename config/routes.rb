Juan::Application.routes.draw do

  root :to => 'high_voltage/pages#show', id: 'home'
  get "poem/show", to: 'poem#show'

  resources :poem, only: [] do
    collection do
      match 'search', to: 'poem#search', via: [:get, :post], as: :search
    end
  end

  resources :cantos, only: [] do
    resources :stanzas, only: [:index, :show]
  end

  resources :annotators, only: [] do
    resources :comments, only: [:index, :show]
  end

  scope :format => true, :constraints => { :format => 'json' } do
    get '/comments', to: "comments#show"
    get '/cantos', to: "cantos#number_of_stanzas"
  end

  # resources :contact_forms, only: [:new, :create]
  get 'message', to: "contact_forms#new", as: :message
  post 'messages', to: "contact_forms#create", as: :messages


end





  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

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