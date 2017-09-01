Rails.application.routes.draw do
  resources :pointlesses do
    resources :pcomments
    end
  mount Ckeditor::Engine => '/ckeditor'
  resources :events
  resources :forests do
    resources :fcomments
  end
  post 'pointlesses/like'
  post 'pointlesses/dislike'
  devise_for :users
  root "main#dashboard"

  get 'partypost' => 'partypost#index'
  get 'partylike' => 'partypost#partylike'

  post 'partycreate' => 'partypost#partycreate'

  get "partylike/:post_id" => "partypost#partylike"
  get "partyunlike/:post_id" => "partypost#partyunlike"

  get "partyjoin/:post_id" => "partypost#partyjoin"
  get "partydisjoin/:post_id" => "partypost#partydisjoin"


  get 'search/index'

  get 'home/index'
  post'upload' => "home#upload_post"
  post'comment' => "home#comment"
  get 'search', to: "search#index"


  get 'main/dashboard'
  get 'forests/maketrue'
  get'maketrue' => 'forests#maketrue'

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
