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
      resources :custs
      resources :leafs
      get '/wedding-customizations', to: 'custs#get_cust', as: 'get_wcust'

    end
    
    namespace :api, defaults: { format: :json} do
      scope module: "v1" do
        resources :discovers
        resources :categories
        get '/get_discovers/:id', to: 'categories#get_discovers', as: 'get_discovers'
        get '/modal_info/:id', to: 'products#modal_info', as: 'modal_info'
        get 'get_default_feed', to: 'feeds#get_default_feed', as: 'get_default_feed'
        get '/search_prod/:id', to: 'products#search_prod', as: 'search_prod'
      end
    end


    resources :categories
    resources :sub_categories   
    resources :colors
    resources :ratings 
    resources :contests
    resources :entries
    resources :designers
    resources :discovers
    resources :suite_images
    resources :pogos
    resources :leads
    
    get '/complete_account', to: 'designers#complete_account', as: 'designer_complete_account'    

    resources :users do
      member do
        get :following, :followers
        get :discover_following
      end
    end
    resources :relationships, only: [:create, :destroy]
    resources :discoverfollows, only: [:create, :destroy]

    
    resources :products do
      resources :reviews, only: [:index, :new, :create] do
      end
    end

    resources :designers do
      resources :reviews, only: [:index, :new, :create] do
      end
    end
    #post '/reviews/:review_id/feedback(.:format)' => 'feedback_reviews#create', as: :feedback_reviews




    
    get '/wedding-invitations', to: 'landing_pages#wedding', as: 'wedding'
    get '/wedding-accessories', to: 'landing_pages#wedaccs', as: 'wedaccs'
    get '/greetings', to: 'landing_pages#greetings', as: 'greetings'
    get '/other-invites', to: 'landing_pages#otherinvite', as: 'partyinvite'

    get '/like/:id', to: 'likes#create', as: 'like_suite'
    get '/unlike/:id', to: 'likes#destroy', as: 'unlike_suite'
    get '/designer_dashboard', to: 'designers#dashboard', as: 'designer_dashboard'
    get '/contact-us', to: 'contactus#contact', as:'contact_us'
    get '/get_prd_images/:id', to: 'suites#get_prd_images'
    get '/get_suite_chars/:id', to: 'suites#get_suite_chars'
    get '/why-buy-from-us', to:'wbfromus#whybuyfromus'
    get '/guest-addressing', to:'guestaddressing#guestaddressing'
    get '/paper-and-print-styles', to:'printpaperpage#printpaperpage'
    get '/bonheur', to:'bonheur#bonheur'
    get '/about-us', to:'aboutus#aboutus'
    get '/wedding-invitations/:id', to: 'shop#wedding', as: 'wedding-invitations'
    get '/greeting-cards/:id', to: 'shop#greeting', as: 'greeting-cards'
    get '/other-invitations/:id', to: 'shop#otherinvites', as: 'partyinvites'
    get '/get-dedicated-designer', to:'dedicateddesigner#dedicateddesigner'
    get '/customization', to:'suites#customization'
    get '/privacy-policy', to:'privacy#privacy'
    get '/copyright-policy', to:'copyright#copyright'
    get '/how-it-works', to:'howitworks#howitworks'
    get '/return-policy', to:'privacy#return'

    post '/add_comment', to: 'comments#add_comment', as: 'add_comment'
    get '/test/:id', to: 'discovers#test', as: 'test_product'
    post '/delete_comment', to: 'comments#delete_comment', as: 'delete_comment'
    get '/other_forms/:id', to: 'reviews#other_forms', as: 'other_forms'

    get '/search'  => 'solrsearch#index', as: 'search'
    routes = lambda do
      namespace :admin do
        resources :products do
          collection { post :import }
          resources :variants do
            get :volume_prices, :on => :member
          end
        end
        get '/bulk_upload', to: 'products#bulk_upload', as: 'bulk_upload'
        resources :designers do 
          post :deactivate
          post :activate
        end
        
        resources :reviews, only: [:index, :destroy, :edit, :update] do
          member do
            get :approve
          end
          resources :feedback_reviews, only: [:index, :destroy]
        end
        resource :review_settings, only: [:edit, :update]
        
        resources :banners
        resources :categories
        resources :sub_categories
        resources :suite_images
        resources :colors
        resources :pogos
        resources :leads
        resources :prodinfos
        resources :similarprods do
          collection { post :import }
        end
        
        resources :suites do
          resources :characteristics
        end
        resources :discovers
        #delete '/volume_prices/:id', :to => "volume_prices#destroy", :as => :volume_price
      end
    end
    if Spree::Core::Engine.respond_to?(:add_routes)
      Spree::Core::Engine.add_routes(&routes)
    else
      Spree::Core::Engine.routes.draw(&routes)
    end
    
  end

  devise_scope :person do
  get '/login', :to => "devise/sessions#new"
  get '/signup', :to => "devise/registrations#new"
  delete '/logout', :to => "devise/sessions#destroy"
  get '/designer_signup', :to => "devise/registrations#new_designer"
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
