Rails.application.routes.draw do
  devise_for :users
  root 'toukou#index'
  get 'business/posting' #この記法は覚えておく。
  get 'dairy/posting'
  get 'others/posting'
  get 'business/search'
  get 'dairy/search'
  get 'others/search'


  #このようにして、idに紐付けた独自のアクションを追加できる。
  resources :users do
    member do
      get :questions
      get :counts
    end
  end

  #以下いいね！機能用のルーティング
  resources :business do
    member do
      post :like
      delete :like_delete
    end
  end

  #いいね！用のルーティング終わり

  resources :users, only: [:show, :questions, :counts]
  resources :toukou, only: [:index]
  resources :business, only: [:index, :create, :show] do
    resources :busianswer, only: [:create]
    #ネストすると、businessテーブルのid情報をparamsとしてbusianswerテーブルに送れる
  end
  resources :dairy, only: [:index, :create, :show] do
    resources :dairyanswer, only: [:create]
    #ネストすると、dairyテーブルのid情報をparamsとしてdairyanswerテーブルに送れる
  end

  resources :others, only: [:index, :create, :show] do
    resources :otheranswer, only: [:create]
    #ネストすると、othersテーブルのid情報をparamsとしてotheranswerテーブルに送れる
  end

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
