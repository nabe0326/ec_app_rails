Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root "homes#top"
  resources :products do
    # 商品IDを含ませたいので、商品のルーティングにネストさせる
    # createアクションのみのルーティング
    resources :cart_products , only: [:create]
    # destroyアクションのみのルーティング
    resource :cart_products, only: [:destroy]
  end
  # カート内商品を表示させるためのルーティング
  resources :cart_products , only: [:index]
  # cart_productsモデルについての表示は一覧ページの

  get '/complete', to: 'homes#complete' 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
