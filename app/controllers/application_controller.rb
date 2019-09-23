class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production? #basic認証を本番環境のみで利用する下記参照
  protect_from_forgery with: :exception

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:lastname, :firstname, :lastkana, :firstkana, :birthyear, :birthmonth, :birthday])
    end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == '59_mercari_a' && password == '59a'
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end