Demo::Application.routes.draw do
 
  get "doyourememberme/index"
  get "doyourememberme/views"
  get "doyourememberme/usercomments"
  get "doyourememberme/userfollowedby"
  get "doyourememberme/userfollowing"
  get "doyourememberme/userprofile"
  get "doyourememberme/userrememberedmemories"
  get "doyourememberme/GetMemories"
  get "doyourememberme/search"
  get "doyourememberme/emailconform"
  get "doyourememberme/submittedmemories"
 
  get "doyourememberme/create"
  get "doyourememberme/signin"
  get "doyourememberme/memories"
  get "doyourememberme/choice"
  get "doyourememberme/comments"
  get "doyourememberme/followedby"
  get "doyourememberme/followuser"
  get "doyourememberme/following"
  get "doyourememberme/choicetester"
  get "doyourememberme/catsuggest"
  get "doyourememberme/getcategories"
  get "doyourememberme/getcomments"
  get "doyourememberme/getdecades"
  get "doyourememberme/getshowdown"
  get "doyourememberme/GetSingleMemory"
  get "doyourememberme/getuserdetails"
  get "doyourememberme/listshowdowncomments"
  get "doyourememberme/rememberedmemories"
  get "doyourememberme/memuserprofile"
  get "doyourememberme/result"
  get "doyourememberme/a2"
  get "doyourememberme/a1"
  get "doyourememberme/B"
  get "doyourememberme/home"
  get "doyourememberme/all"
  get "doyourememberme/addcoments"
  get "doyourememberme/addfavourite"
  post "doyourememberme/addfavourite"
  get "doyourememberme/addmemoriedetails"
  get "doyourememberme/addshowdowncomments"
   get "doyourememberme/veiwmemories123"
   get "doyourememberme/do"
   get "doyourememberme/login"
   get "doyourememberme/logout"
   get "doyourememberme/sdresult"
   get "doyourememberme/sdresult123"
   get "doyourememberme/help"
   get "doyourememberme/ramesh"
   get "doyourememberme/reg"
  

post "doyourememberme/sdresult"
post "doyourememberme/memories"
post "doyourememberme/login"
post "doyourememberme/login123"

 resources :doyourememberme

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
   root :to => 'doyourememberme#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
