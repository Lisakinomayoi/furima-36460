class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, presence: { message: "can't be blank" }
    validates :last_name, presence: { message: "can't be blank" },
                          format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: 'Full-width characters' }
    validates :first_name, presence: { message: "can't be blank" },
                           format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: 'Full-width characters' }
    validates :last_name_kana, presence: { message: "can't be blank" },
                               format: { with: /\A[ァ-ヶ]+\z/, message: 'Full-width characters' }
    validates :first_name_kana, presence: { message: "can't be blank" },
                                format: { with: /\A[ァ-ヶ]+\z/, message: 'Full-width characters' }
    validates :birth_date
  end
  validates :password, presence: { message:  "confirmation can't be blank" },
                       length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
end