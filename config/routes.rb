require File.dirname(__FILE__) + '/../lib/api_constraints'
Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  if Rails.env.development?
    namespace :mailers do
      scope :users do
        get '(/:action(/:id(.:format)))' => 'users_emails#:action'
      end
    end
  end

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      scope :queue_users do
        post 'create' => 'queue_users#create'
        get ':slug/activate' => 'queue_users#activate'
        post 'resend' => 'queue_users#resend'
      end
      scope :reset_passwords do
        post 'create' => 'reset_passwords#create'
        post 'reset' => 'reset_passwords#reset'
        get ':slug' => 'reset_passwords#show'
      end
      scope :search do
        get 'simple' => 'search#simple'
      end
      scope :sessions do
        post 'create' => 'sessions#create'
      end
      scope :users do
        get '/' => 'users#index'
        put 'update' => 'users#update'
        scope ':username'.to_sym do
          get '/' => 'users#show'
          get 'studies' => 'studies#index', parent_scope: :users
          post 'studies/is_admin' => 'studies#is_admin', parent_scope: :users
          get 'appointments' => 'appointments#index', parent_scope: :users
          get 'locations' => 'locations#index', parent_scope: :users
        end
      end
    end
  end


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
