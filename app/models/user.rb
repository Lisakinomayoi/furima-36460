class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, presence: { message: "nickname can't be blank" }
    # validates :email
    # validates :encrypted_password #format: {with:#/(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}#{with: /\A[a-z0-9]+\z/, message: 'Half-width characters numbers'}
    validates :last_name, presence: { message: "can't be blank" },
                          format: { with: /[^ -~｡-ﾟ]+/, message: 'Full-width characters' }
    validates :first_name, presence: { message: "can't be blank" },
                           format: { with: /[^ -~｡-ﾟ]+/, message: 'Full-width characters' }
    validates :last_name_kana, presence: { message: "can't be blank" },
                               format: { with: /[^ -~｡-ﾟ]+/, message: 'Full-width characters' }
    validates :first_name_kana, presence: { message: "can't be blank" },
                                format: { with: /[^ -~｡-ﾟ]+/, message: 'Full-width characters' }
    validates :birth_date
  end
  validates :encrypted_password, :password, :password_confirmation, presence: { message: "password can't be blank" },
                                                                    length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ }
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i#/A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  # validates :encrypted_password, confirmation: true, format: { with: VALID_PASSWORD_REGEX,
  # message: "は半角6文字以上英大文字・小文字・数字それぞれ１文字以上含む必要があります"}
end
