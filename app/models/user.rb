class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

         has_many :sns_credentials, dependent: :destroy
         has_many :addresses
         has_many :phone_numbers
         has_one :card
        #  devise :validatable, password_length: 7..128
        validates :nickname, :lastname, :firstname, :lastkana, :firstkana, :birthyear, :birthmonth, :birthday, presence: true
        validates_format_of :password, :with => /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, :message => "は７文字以上128字以下の英数両方を含むよう入力してください。"
       

        def self.find_for_oauth(auth)
          sns = SnsCredential.where(uid: auth.uid, provider: auth.provider).first
          unless sns
            @user = User.create(
            email:    auth.info.email,
            password: Devise.friendly_token[0,20]
            )
            sns = SnsCredential.create(
            user_id: @user.id,
            uid: auth.uid,
            provider: auth.provider
            )
         end
          sns
          @user
        end

end
