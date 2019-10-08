class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  before_action :basic_auth, if: :production? #basic認証を本番環境のみで利用する下記参照
  protect_from_forgery with: :exception
  before_action :set_search
  before_action :category_pulldown

  def set_search
    @q = Item.ransack(params[:q])
    @item = @q.result(distinct: true)
  end
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:lastname, :firstname, :lastkana, :firstkana, :birthyear, :birthmonth, :birthday, :phone_number, :area_number, :prefecture, :municipalities, :address_number, :building, :tel_number,:avatar])
  end

  private
def category_pulldown
  @category_parents = Category.where(ancestry: nil)
end

  def production?
    Rails.env.production?
  end

  def after_sign_in_path_for(resource)
    @user = current_user
    @addresses = @user.addresses.includes(:user)
    if @addresses.present?
       root_path
    else     
      "/phonenumbers/new"
    end
  end

  # def after_sign_out_path_for(resouce)
  #   root_path
  # end 

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == '59_mercari_a' && password == '59a'
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

