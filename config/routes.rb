EuroExim::Application.routes.draw do
  

  resources :booking_reports


  resources :booking_emailers


  resources :sales_call_enquiries


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :sales_call_entries


  resources :customers


  resources :bookings do as_routes end
  resources :cities do as_routes end
  resources :bookings


  resources :booking_orders

  resources :emailers

   devise_for :users do
  ActiveAdmin.routes(self)
     get "users/sign_in", :to => "devise/sessions#new"
     get "users/sign_out", :to => "devise/sessions#destroy"
  end
  # get "home/index"
  match '/reports/fields'
  root :to => 'home#index'
  resources :reports
  match '/add_booking' => 'booking_orders#booking'
  match '/send_email_to_customer' => 'booking_orders#send_email_to_customer'
  match '/send_email_to_user' => 'booking_orders#send_email_to_user'
  mount Ckeditor::Engine => '/ckeditor'
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
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match '(/:action(/:id(.:format)))' => 'home#:action'
end
