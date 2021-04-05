class User < ApplicationRecord
  has_many :products

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'Full-width characters' } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
      validates :read_family
      validates :read_first
    end
  end
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/, message: 'Include both letters and numbers' }
end
