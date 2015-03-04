Rails.application.routes.draw do

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, :at => '/'
  #mount Blogit::Engine => "/blog"
  mount Monologue::Engine, at: '/blog'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  Spree::Core::Engine.routes.draw do
    resources :suites do
      resources :reviews
      resources :likes
    end

    resources :categories
    resources :sub_categories
    
    resources :colors
    

    

   
    resources :contests
    resources :entries

    resources :designers

    
    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :relationships, only: [:create, :destroy]
    
    get '/wedding', to: 'landing_pages#wedding'
    get '/like', to: 'likes#create', as: 'like_suite'
    get '/unlike', to: 'likes#destroy', as: 'unlike_suite'

    get '/search'  => 'solrsearch#index'
    routes = lambda do
      namespace :admin do
        resources :products do
          resources :variants do
            #get :volume_prices, :on => :member
          end
        end
        resources :designers do 
          post :deactivate
          post :activate
          
        end
        resources :banners
        resources :suites
        #delete '/volume_prices/:id', :to => "volume_prices#destroy", :as => :volume_price
      end
    end
    if Spree::Core::Engine.respond_to?(:add_routes)
      Spree::Core::Engine.add_routes(&routes)
    else
      Spree::Core::Engine.routes.draw(&routes)
    end
    
  end

  #get '/suites/:id' => 'suites#show'

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
