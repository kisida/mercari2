Rails.application.routes.draw do
   #devise周り
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
}
  root 'mains#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'emailpass' => "users/registrations#emailpass"
    get "signup/phone_number" => "users/registrations#phone_number"
    get "signup/address" => "users/registrations#address"
    post "signup/credit" => "users/registrations#credit"
    post "signup/card" => "users/registrations#card"

    end
end
