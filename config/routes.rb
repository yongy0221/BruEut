Rails.application.routes.draw do
  #-----routes for Ckeditor
  mount Ckeditor::Engine => '/ckeditor'

  #-----main routes
  post 'main/make'
  post 'main/report'
  get 'main/admin'
  get 'main/firstlogin'
  get 'main/dashboard'
  root "main#dashboard"


  #-------google login routes
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]

 #--------market routes

  get 'markets/msindex'
  get 'markets/mrindex'
  resources :markets do
    resources :mcomments
  end
  post 'markets/sold'
  post 'markets/like'
  post 'markets/dislike'

  #-----pointless routes
  get 'pointlesses/rindex'
  resources :pointlesses do
    resources :pcomments
  end
  post 'pointlesses/like'
  post 'pointlesses/dislike'

  #------event routes
  resources :events

  #-----forest routes
  get 'forests/admin'
  get 'forests/admin_part'
  resources :forests do
    resources :fcomments
  end
  get 'forests/maketrue'
  get 'forests/blind'
  get 'maketrue' => 'forests#maketrue'
  get 'blind' => 'forests#blind'

<<<<<<< HEAD
  get "forestlike/:forest_id" => "forests#forestlike"
  get "forestunlike/:forest_id" => "forests#forestunlike"
  get "forestdislike/:forest_id" => "forests#forestdislike"
  get "forestundislike/:forest_id" => "forests#forestundislike"

=======
>>>>>>> 56a5a8f368b6cc782432e3fd2d4edebc23133d40
#-------partypost routes
  get 'partypost' => 'partypost#index'
  get 'partylike' => 'partypost#partylike'
  post 'partycreate' => 'partypost#partycreate'
<<<<<<< HEAD
  post 'partycomment' => "partypost#partycomment"
=======
>>>>>>> 56a5a8f368b6cc782432e3fd2d4edebc23133d40
  get "partylike/:post_id" => "partypost#partylike"
  get "partyunlike/:post_id" => "partypost#partyunlike"
  get "partyjoin/:post_id" => "partypost#partyjoin"
  get "partydisjoin/:post_id" => "partypost#partydisjoin"

#------search routes
  get 'search/index'
  get 'home/index'
  post'upload' => "home#upload_post"
  post'comment' => "home#comment"
  get 'search', to: "search#index"


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
