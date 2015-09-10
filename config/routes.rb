Rails.application.routes.draw do

  

  match  'whatsapp' => 'whatsapp#index'  , as: :whatsapp, :via => [:get]
  post   'add_filter' => 'whatsapp#create' , as: :add_filter
  delete 'whatsapp' => 'whatsapp#destroy', as: :delete_filter

  match 'yester' => 'yesterdays#yesterday', as: :yester, :via =>[:get]
  resources :yesterdays, only: [:index]

  # get 'droms/index'

  # get 'droms/create'

  # get 'regions/index'

  #get 'search/search'

  post   'sessions' => 'user_sessions#create', :as => 'login'
  delete 'sessions' => 'user_sessions#destroy', :as => 'logout'
    
  namespace :admin do
    resources :admins, only: [:index, :new, :create, :destroy]
    #resources :users, path: '/admin/users'#, only: [:index, :new, :create]
  #get 'admins/index'
  end
  scope module: 'admin' do
    resources :users
  end


  # resources :ads, only: [:index, :create, :search]
  resources :ads,   only: [:create]
  resources :droms, only: [:create]
  #get 'ads/index'
  # убрать как устаревший
  match 'search_m' => 'ads#search_m', as: :search_m, :via => [:get]
  match 'last' => 'ads#last',         as: :last,     :via => [:get]
  match 'last_drom' => 'droms#last_d',as: :last_drom,:via => [:get]


  match 'search' => 'search#search', as: :search, :via => [:get]
  match 'search_drom' => 'search#search_drom', as: :search_drom, :via => [:get]

  # You can have the root of your site routed with "root"
  root 'welcome#index'
    
  get 'welcome/download_apk', as: :advert

  resources :engines, :bodies, :colors, :capacities, :releases, :steers, only: [:index]
  resources :owners, :states, :drives, :odometers, :gearboxes, only: [:index]
  
  resources :black_lists

  get 'versions' => 'versions#index', :as => 'version'
  #resource :user_sessions, only: [:create, :new, :destroy]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  

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
  resources :markas do
  #     resources :comments, :sales
    resources :models, shallow: true
  end

  resources :regions do
    resources :locations, shallow: true
  end

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
