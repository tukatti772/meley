Rails.application.routes.draw do
  devise_for :users, :controllers => {
 :registrations => 'users/registrations'
}
  root 'dairy#index'
  get 'dairy/posting'
  get 'dairy/search'


  resources :users, only: [:questions, :counts, :follows, :followers, :bookmarks] do
      get :questions
      get :counts
      get :follows
      get :followers
      get :bookmarks
  end

#------------以下いいね！機能用のルーティング---------------------------------

#member doならばdairy/:id/...,下記のように書けばdairy/dairy_id/...のようになる。
#dairyに紐づいていれば:dairy_id,userに紐づいていれば:user_idを渡すように、直感的になるように統一しておいた方が良い。
#:idと:dairy_idなどが混在していると、パラメータの受け渡しの際に混乱するし齟齬が生じる。
  resources :dairy, only: [:like, :like_delete, :bookmark, :bookmark_delete] do
      post :like
      delete :like_delete
      post :bookmark
      delete :bookmark_delete
  end

  resources :dairyanswer, only: [:like, :like_delete] do
      post :like
      delete :like_delete
  end

#------------いいね！用のルーティング終わり---------------------------------

  resources :users, only: [:show]
  resources :toukou, only: [:index]
  resources :tags, only: [:show]
  resources :dairy, only: [:index, :create, :show] do
    resources :dairyanswer, only: [:create]
    #ネストすると、dairy_idをparamsとしてdairyanswerテーブルに送れる
  end
  resources :relationships, only: [:create, :destroy]

 
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
