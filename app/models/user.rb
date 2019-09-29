class User < ApplicationRecord
  attr_accessor :skip_password_validation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable,:database_authenticatable, :registerable,
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
          user = User.where(uid: auth.uid, provider: auth.provider).first
          unless user
            user = User.create(
              uid:      auth.uid,
              provider: auth.provider,
              nickname:     auth.info.name,
              email:    User.dummy_email(auth),
              password: Devise.friendly_token[0, 20]
            )
         end
          user
        end

        

        private
        def self.dummy_email(auth)
          "#{auth.uid}-#{auth.provider}@example.com"
        end

end
