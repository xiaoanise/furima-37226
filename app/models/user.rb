class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'includes both letters and numbers', allow_blank: true

  with_options presence: true do
    validates :nickname
    validates :birthday

    NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    validates_format_of :last_name, with: NAME_REGEX
    validates_format_of :first_name, with: NAME_REGEX
  
    NAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
    validates_format_of :last_name_kana, with: NAMEKANA_REGEX
    validates_format_of :first_name_kana, with: NAMEKANA_REGEX
  end
end
