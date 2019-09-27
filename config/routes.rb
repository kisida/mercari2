Rails.application.routes.draw do

  get 'details/show'

  root 'mains#index'
  
  resources :addresses,only: [:new, :create]
   #devise周り
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
}

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'emailpass' => "users/registrations#emailpass"
    get "signup/phone_number" => "users/registrations#phone_number"
    get "signup/credit" => "users/registrations#credit"

    

    post"signup/card" => "users/registrations#card"


    end

    resources :products
    resources :users, only: [:index, :show, :destroy] do
      collection do
      get :logout
      get :credit
     end
    end
   end
