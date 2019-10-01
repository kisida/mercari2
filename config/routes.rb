Rails.application.routes.draw do
  root 'mains#index'

  
  # get 'card/new'
  # get 'card/show'


  get 'card/new'
  get 'card/show'

  get 'users/edit'

  get 'users/show'
  get 'users/index'
  get 'users/logout'
  get 'users/credit_new'

  
  # collectionはカテゴリー習得用です
  resources :products do
    collection do
    get 'get_children', defaults: { format: 'json' }
    get 'get_grand_children', defaults: { format: 'json' }
    end
  end



  # 中島エリア Don't touch!!＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
  resources :card, only: [:new, :show] do
    collection do

      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  resources :addresses,only: [:new, :create]

  resources :phonenumbers,only: [:new, :create]

  #devise周り
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users,
  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',

    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: "users/confirmations"
}


  devise_scope :user do
    get 'emailpass' => "users/registrations#emailpass"
    get "signup/credit" => "users/registrations#credit"
    get "signup/card" => "users/registrations#card"
    get "world" =>  "users/registrations#world"
    end


    resources :users, only: [:index, :show, :destroy] do
      collection do

      end
      get :logout
      get :credit
      get :credit_new
      get :status_selling
      get :status_trading
      get :status_sold

     end
      get :regist

      end
    end
  # 中島エリア Don't touch!!＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

