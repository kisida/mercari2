Rails.application.routes.draw do
   #devise周り
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
}
  root 'mains#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'signup' => 'users/registrations#signup'
    get "/signup/registration" => "users/registrations#new"
    post "signup/phone_number" => "users/registrations#phone_number"
    get "signup/address" => "users/registrations#address"
    post "signup/address" => "users/registrations#address"
    get "signup/credit" => "users/registrations#credit"

    end

    resources :products
    resources :users, only: [:index,:show, :destroy] do
      collection do
      get :logout
     end
    end
   end
