Rails.application.routes.draw do

  get 'card/new'
  get 'card/show'
  get 'details/show'

  root 'mains#index'
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
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
}

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'emailpass' => "users/registrations#emailpass"
    get "signup/credit" => "users/registrations#credit"
    get"signup/card" => "users/registrations#card"
    end

    resources :products
    resources :users, only: [:index,:show, :destroy] do
      collection do
      get :logout

  
     end
    end
   end
